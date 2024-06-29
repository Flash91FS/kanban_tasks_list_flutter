import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/domain/models/task.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/tasks_state.dart';
import 'package:kanban_tasks_list_flutter/repository/i_tasks_repository.dart';
import 'package:kanban_tasks_list_flutter/utils.dart';

class TasksCubit extends Cubit<TasksState> {
  final ITasksRepository TasksRepository;

  TasksCubit({required this.TasksRepository})
      : super(const TasksState.loading());

  Future<void> loadResults() async {
    try {
      Result<List<Task>> results = await TasksRepository.getTasksList();
      logData('TasksCubit', 'results = $results');
      results.when(success: (List<Task> items) {
        logData('TasksCubit', 'items = $items');
        emit(TasksState.loaded(
          allItems: items,
        ));
      }, failure: (_) {
        logData('TasksCubit', 'failure:');
        emit(const TasksState.failedToLoad());
      });
    } on Error {
      logData('TasksCubit', 'Error:');
      emit(const TasksState.failedToLoad());
    } on Exception {
      logData('TasksCubit', 'Exception:');
      emit(const TasksState.failedToLoad());
    }
  }
}
