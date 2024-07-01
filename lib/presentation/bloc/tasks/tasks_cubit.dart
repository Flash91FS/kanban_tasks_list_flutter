import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/core/page_state_status.dart';
import 'package:kanban_tasks_list_flutter/domain/models/task.dart';
import 'package:kanban_tasks_list_flutter/firebase/firebase_methods.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/environment/environment_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/tasks/tasks_state.dart';
import 'package:kanban_tasks_list_flutter/repository/i_tasks_repository.dart';
import 'package:kanban_tasks_list_flutter/utils.dart';
import 'package:uuid/uuid.dart';

class TasksCubit extends Cubit<TasksState> {
  final ITasksRepository tasksRepository;
  final EnvironmentCubit environmentCubit;

  TasksCubit({required this.tasksRepository, required this.environmentCubit})
      : super(const TasksState(status: PageStateStatus.loading));

  Future<void> loadResults() async {
    try {
      Result<List<Task>> results = await tasksRepository.getTasksList();
      logData(TAG_TASKS_CUBIT, 'results = $results');
      results.when(success: (List<Task> items) {
        items.forEach((item) {
          logData(TAG_TASKS_CUBIT,
              'All-Tasks - item : ${item.id} -  ${item.projectId} - ${item.content} - ${item.description}');
        });

        final currentProjectTasks = items
            .where((element) =>
                element.projectId == environmentCubit.state.projectId)
            .toList();

        currentProjectTasks.forEach((current) {
          logData(TAG_TASKS_CUBIT,
              'Project-Tasks - current : ${current.id} -  ${current.projectId} - ${current.content} - ${current.description}');
        });

        emit(state.copyWith(
          status: PageStateStatus.loaded,
          tasks: currentProjectTasks,
        ));
      }, failure: (_) {
        logData(TAG_TASKS_CUBIT, 'failure:');
        emit(state.copyWith(
          status: PageStateStatus.failedToLoad,
          errorMessage: 'Failed to load Tasks.',
        ));
      });
    } on Error {
      logData(TAG_TASKS_CUBIT, 'Error:');
      emit(state.copyWith(
        status: PageStateStatus.failedToLoad,
        errorMessage: 'Failed to load Tasks.',
      ));
    } on Exception {
      logData(TAG_TASKS_CUBIT, 'Exception:');
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
      logData(TAG_TASKS_CUBIT, 'results = $result');
      result.when(success: (Task item) async {
        logData(TAG_TASKS_CUBIT,
            'addNewTask(): - item : ${item.id} -  ${item.projectId} - ${item.content} - ${item.description}');

        final newTaskList = List<Task>.from(state.tasks!)..add(item);

        ///Add a new task in FB
        //Todo make a call to repository/api instead of directly calling FireStore Methods
        String res = await FireStoreMethods().postTask(taskId: item.id);
        logData(TAG_TASKS_CUBIT, 'addNewTask() - FireStoreMethods().postTask : res = $res');

        newTaskList.forEach((task) {
          logData(TAG_TASKS_CUBIT,
              'addNewTask() - task : ${task.id} -  ${task.projectId} - ${task.content} - ${task.description}');
        });

        emit(state.copyWith(
            status: PageStateStatus.updated, tasks: newTaskList));
      }, failure: (_) {
        logData(TAG_TASKS_CUBIT, 'failure:');
        emit(state.copyWith(
          status: PageStateStatus.failedToLoad,
          errorMessage: 'Failed to load Tasks.',
        ));
      });
    } on Error {
      logData(TAG_TASKS_CUBIT, 'Error:');
      emit(state.copyWith(
        status: PageStateStatus.failedToLoad,
        errorMessage: 'Failed to load Tasks.',
      ));
    } on Exception {
      logData(TAG_TASKS_CUBIT, 'Exception:');
      emit(state.copyWith(
        status: PageStateStatus.failedToLoad,
        errorMessage: 'Failed to load Tasks.',
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
      logData(TAG_TASKS_CUBIT, 'results = $result');
      result.when(success: (Task item) {
        logData(TAG_TASKS_CUBIT,
            'addNewTask(): - item : ${item.id} -  ${item.projectId} - ${item.content} - ${item.description}');

        final newTaskList = List<Task>.from(state.tasks!);
        int indexOfTask =
            newTaskList.indexWhere((element) => element.id == taskId);
        newTaskList.replaceRange(indexOfTask, indexOfTask + 1, [item]);

        newTaskList.forEach((task) {
          logData(TAG_TASKS_CUBIT,
              'addNewTask() - task : ${task.id} -  ${task.projectId} - ${task.content} - ${task.description}');
        });
        emit(state.copyWith(
            status: PageStateStatus.updated, tasks: newTaskList));
      }, failure: (_) {
        logData(TAG_TASKS_CUBIT, 'failure:');
        emit(state.copyWith(
          status: PageStateStatus.failedToLoad,
          errorMessage: 'Failed to load Tasks.',
        ));
      });
    } on Error {
      logData(TAG_TASKS_CUBIT, 'Error:');
      emit(state.copyWith(
        status: PageStateStatus.failedToLoad,
        errorMessage: 'Failed to load Tasks.',
      ));
    } on Exception {
      logData(TAG_TASKS_CUBIT, 'Exception:');
      emit(state.copyWith(
        status: PageStateStatus.failedToLoad,
        errorMessage: 'Failed to load Tasks.',
      ));
    }
  }

  Future<void> deleteTask({required String taskId}) async {
    try {
      Result<String> result = await tasksRepository.deleteTask(taskId: taskId);

      result.when(success: (String message) {
        logData(TAG_TASKS_CUBIT, 'deleteTask() - Result-Success: $message');

        int indexOfTask =
            state.tasks!.indexWhere((element) => element.id == taskId);
        final newTaskList = List<Task>.from(state.tasks!)
          ..removeAt(indexOfTask);

        newTaskList.forEach((task) {
          logData(TAG_TASKS_CUBIT,
              'deleteTask() - task : ${task.id} -  ${task.projectId} - ${task.content} - ${task.description}');
        });
        emit(state.copyWith(
            status: PageStateStatus.updated, tasks: newTaskList));
      }, failure: (_) {
        logData(TAG_TASKS_CUBIT, 'failure: Failed To Delete');
      });
    } catch (e) {
      logData(TAG_TASKS_CUBIT, 'deleteTask(): Exception = ${e.toString()}');
    }
  }

  Future<void> loadSyncState() async {
    logData(TAG_PROJECTS_CUBIT, 'loadSyncState():');
    try {
      Result<String> result = await tasksRepository.loadSyncState();
      logData(TAG_PROJECTS_CUBIT, 'result = $result');
      result.when(success: (String data) {
        logData(TAG_PROJECTS_CUBIT, 'data = $data');
        emit(state.copyWith(
          syncToken: data,
        ));
      }, failure: (Exception e) {
        logData(TAG_PROJECTS_CUBIT, 'failure: ${e.toString()}');
      });
    } on Error {
      logData(TAG_PROJECTS_CUBIT, 'Error:');
    } on Exception {
      logData(TAG_PROJECTS_CUBIT, 'Exception: ');
    }
  }

  Future<void> moveTaskToSection({
    required String taskId,
    required String toSectionId,
  }) async {
    logData(TAG_PROJECTS_CUBIT, 'moveTaskToSection():');
    if (state.syncToken != null) {
      try {
        Result<String> result = await tasksRepository.moveTaskToSection(
            syncToken: state.syncToken!,
            uuid: const Uuid().v4(),
            taskId: taskId,
            toSectionId: toSectionId);
        logData(TAG_PROJECTS_CUBIT, 'result = $result');
        result.when(success: (String data) {
          logData(TAG_PROJECTS_CUBIT, 'data = $data');

          final newTaskList = List<Task>.from(state.tasks!);
          int indexOfTask =
              newTaskList.indexWhere((element) => element.id == taskId);

          final taskToMove = newTaskList[indexOfTask];
          logData(TAG_PROJECTS_CUBIT,
              'OLD taskToMove.sectionId = ${taskToMove.sectionId}');

          final mTask =
              newTaskList[indexOfTask].copyWith(sectionId: toSectionId);
          newTaskList.replaceRange(indexOfTask, indexOfTask + 1, [mTask]);
          emit(state.copyWith(
            syncToken: data,
            status: PageStateStatus.updated,
            tasks: newTaskList,
          ));
        }, failure: (Exception e) {
          logData(TAG_PROJECTS_CUBIT, 'failure: ${e.toString()}');
        });
      } on Error {
        logData(TAG_PROJECTS_CUBIT, 'Error:');
      } on Exception {
        logData(TAG_PROJECTS_CUBIT, 'Exception: ');
      }
    }
  }
}
