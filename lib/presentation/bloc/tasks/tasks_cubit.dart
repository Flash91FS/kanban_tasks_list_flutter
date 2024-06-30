import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/core/page_state_status.dart';
import 'package:kanban_tasks_list_flutter/domain/models/kanban_item_data_model.dart';
import 'package:kanban_tasks_list_flutter/domain/models/task.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/environment/environment_cubit.dart';

import 'package:kanban_tasks_list_flutter/presentation/bloc/tasks/tasks_state.dart';
import 'package:kanban_tasks_list_flutter/repository/i_tasks_repository.dart';
import 'package:kanban_tasks_list_flutter/utils.dart';

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

        emit(TasksState(
          status: PageStateStatus.loaded,
          tasks: currentProjectTasks,
        ));
      }, failure: (_) {
        logData(TAG_TASKS_CUBIT, 'failure:');
        emit(const TasksState(
          status: PageStateStatus.failedToLoad,
          errorMessage: 'Failed to load Tasks.',
        ));
      });
    } on Error {
      logData(TAG_TASKS_CUBIT, 'Error:');
      emit(const TasksState(
        status: PageStateStatus.failedToLoad,
        errorMessage: 'Failed to load Tasks.',
      ));
    } on Exception {
      logData(TAG_TASKS_CUBIT, 'Exception:');
      emit(const TasksState(
        status: PageStateStatus.failedToLoad,
        errorMessage: 'Failed to load Tasks.',
      ));
    }
  }
}