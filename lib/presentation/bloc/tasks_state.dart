import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:kanban_tasks_list_flutter/domain/models/task.dart';

part 'tasks_state.freezed.dart';

@freezed
class TasksState with _$TasksState {
  const factory TasksState.loaded({
    required List<Task> allItems,
  }) = Data;

  const factory TasksState.loading() = Loading;

  const factory TasksState.failedToLoad() = FailedToLoad;
}
