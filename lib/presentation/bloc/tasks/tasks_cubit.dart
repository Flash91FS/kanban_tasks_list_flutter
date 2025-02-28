import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/core/page_state_status.dart';
import 'package:kanban_tasks_list_flutter/domain/entities/task.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/environment/environment_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/tasks/tasks_state.dart';
import 'package:kanban_tasks_list_flutter/domain/irepositories/i_firebase_repository.dart';
import 'package:kanban_tasks_list_flutter/domain/irepositories/i_tasks_repository.dart';
import 'package:kanban_tasks_list_flutter/utils.dart';
import 'package:uuid/uuid.dart';

class TasksCubit extends Cubit<TasksState> {
  final ITasksRepository tasksRepository;
  final IFirebaseRepository firebaseRepository;
  final EnvironmentCubit environmentCubit;

  TasksCubit({
    required this.tasksRepository,
    required this.firebaseRepository,
    required this.environmentCubit,
  }) : super(const TasksState(status: PageStateStatus.loading));

  Future<void> loadResults() async {
    logData(TAG_TASKS_CUBIT, 'loadResults(): ');
    try {
      Result<List<Task>> results = await tasksRepository.getTasksList();
      logData(TAG_TASKS_CUBIT, 'loadResults(): results = ${results}');
      results.when(success: (List<Task> items) {
        final currentProjectTasks = items
            .where((element) =>
                element.projectId == environmentCubit.state.projectId)
            .toList();
        logData(TAG_TASKS_CUBIT,
            'loadResults(): environmentCubit.state.projectId = ${environmentCubit.state.projectId}');
        logData(TAG_TASKS_CUBIT,
            'loadResults(): currentProjectTasks = ${currentProjectTasks}');

        emit(state.copyWith(
          status: PageStateStatus.loaded,
          tasks: currentProjectTasks,
        ));
      }, failure: (_) {
        emit(state.copyWith(
          status: PageStateStatus.failedToLoad,
          errorMessage: 'Failed to load Tasks.',
        ));
      });
    } on Error {
      emit(state.copyWith(
        status: PageStateStatus.failedToLoad,
        errorMessage: 'Failed to load Tasks.',
      ));
    } on Exception {
      emit(state.copyWith(
        status: PageStateStatus.failedToLoad,
        errorMessage: 'Failed to load Tasks.',
      ));
    }
  }

  Future<void> addNewTask({
    required String projectId,
    required String sectionId,
    required String title,
    required String description,
  }) async {
    try {
      Result<Task> result = await tasksRepository.addNewTask(
        projectId: projectId,
        sectionId: sectionId,
        title: title,
        description: description,
      );
      logData(TAG_TASKS_CUBIT, 'addNewTask(): result = ${result}');
      logData(TAG_TASKS_CUBIT, 'addNewTask(): state = ${state}');
      logData(TAG_TASKS_CUBIT, 'addNewTask(): state.tasks = ${state.tasks}');
      result.when(success: (Task item) async {
        final newTaskList = List<Task>.from(state.tasks ?? [])..add(item);
        // or the above line can be achieved in this way
        // final newTaskList = state.tasks != null ? [...state.tasks!, item] : [item];

        logData(TAG_TASKS_CUBIT, 'addNewTask(): newTaskList = ${newTaskList}');

        ///Add a new task in FB-DB
        await firebaseRepository.postTimeTrackingDataForTask(taskId: item.id);

        emit(state.copyWith(
            status: PageStateStatus.updated, tasks: newTaskList));
      }, failure: (_) {
        emit(state.copyWith(
          status: PageStateStatus.failedToUpdate,
          errorMessage: 'Failed to update Tasks.',
        ));
      });
    } on Error {
      emit(state.copyWith(
        status: PageStateStatus.failedToUpdate,
        errorMessage: 'Failed to update Tasks.',
      ));
    } on Exception {
      emit(state.copyWith(
        status: PageStateStatus.failedToUpdate,
        errorMessage: 'Failed to update Tasks.',
      ));
    }
  }

  Future<void> updateTask(
      {required String taskId,
      required String title,
      required String description}) async {
    try {
      Result<Task> result = await tasksRepository.updateTask(
        taskId: taskId,
        title: title,
        description: description,
      );
      result.when(success: (Task item) {
        final newTaskList = List<Task>.from(state.tasks!);
        int indexOfTask =
            newTaskList.indexWhere((element) => element.id == taskId);
        newTaskList.replaceRange(indexOfTask, indexOfTask + 1, [item]);

        emit(state.copyWith(
            status: PageStateStatus.updated, tasks: newTaskList));
      }, failure: (_) {
        emit(state.copyWith(
          status: PageStateStatus.failedToUpdate,
          errorMessage: 'Failed to update Tasks.',
        ));
      });
    } on Error {
      emit(state.copyWith(
        status: PageStateStatus.failedToUpdate,
        errorMessage: 'Failed to update Tasks.',
      ));
    } on Exception {
      emit(state.copyWith(
        status: PageStateStatus.failedToUpdate,
        errorMessage: 'Failed to update Tasks.',
      ));
    }
  }

  Future<void> deleteTask({required String taskId}) async {
    try {
      Result<String> result = await tasksRepository.deleteTask(taskId: taskId);

      result.when(
          success: (String message) {
            int indexOfTask =
                state.tasks!.indexWhere((element) => element.id == taskId);
            final newTaskList = List<Task>.from(state.tasks!)
              ..removeAt(indexOfTask);
            logData(
                TAG_TASKS_CUBIT, 'deleteTask(): newTaskList = ${newTaskList}');
            emit(state.copyWith(
                status: PageStateStatus.updated, tasks: newTaskList));
          },
          failure: (_) {});
    } catch (ex) {
      logData(TAG_TASKS_CUBIT, 'deleteTask(): Exception = ${ex.toString()}');
      emit(state.copyWith(
        status: PageStateStatus.failedToUpdate,
        errorMessage: 'Failed to delete task: ${ex.toString()}',
      ));
    }
  }

  Future<void> loadSyncState() async {
    try {
      Result<String> result = await tasksRepository.loadSyncState();
      result.when(
          success: (String data) {
            emit(state.copyWith(
              syncToken: data,
            ));
          },
          failure: (Exception e) {});
    } catch (ex) {
      logData(TAG_TASKS_CUBIT, 'loadSyncState(): Exception = ${ex.toString()}');
      emit(state.copyWith(
        status: PageStateStatus.failedToUpdate,
        errorMessage: 'Failed to load sync state: ${ex.toString()}',
      ));
    }
  }

  Future<void> moveTaskToSection({
    required String taskId,
    required String toSectionId,
  }) async {
    logData(TAG_TASKS_CUBIT, 'moveTaskToSection():');
    logData(TAG_TASKS_CUBIT, 'moveTaskToSection(): taskId = $taskId');
    logData(TAG_TASKS_CUBIT, 'moveTaskToSection(): toSectionId = $toSectionId');
    if (state.syncToken != null) {
      try {
        Result<String> result = await tasksRepository.moveTaskToSection(
            syncToken: state.syncToken!,
            uuid: const Uuid().v4(),
            taskId: taskId,
            toSectionId: toSectionId);
        result.when(
            success: (String data) {
              final newTaskList = List<Task>.from(state.tasks!);
              int indexOfTask =
                  newTaskList.indexWhere((element) => element.id == taskId);

              final mTask =
                  newTaskList[indexOfTask].copyWith(sectionId: toSectionId);
              newTaskList.replaceRange(indexOfTask, indexOfTask + 1, [mTask]);
              emit(state.copyWith(
                syncToken: data,
                status: PageStateStatus.updated,
                tasks: newTaskList,
              ));
            },
            failure: (Exception e) {
              emit(state.copyWith(
                status: PageStateStatus.failedToUpdate,
                errorMessage: 'Failed to move task: ${e.toString()}',
              ));
            });
      } catch (ex) {
        logData(TAG_TASKS_CUBIT,
            'moveTaskToSection(): Exception = ${ex.toString()}');
        emit(state.copyWith(
          status: PageStateStatus.failedToUpdate,
          errorMessage: 'Failed to move task: ${ex.toString()}',
        ));
      }
    } else {
      emit(state.copyWith(
        status: PageStateStatus.failedToUpdate,
        errorMessage: 'Sync token is null.',
      ));
    }
  }
}
