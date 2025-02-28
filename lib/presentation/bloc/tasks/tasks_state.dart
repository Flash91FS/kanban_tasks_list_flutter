import 'package:appflowy_board/appflowy_board.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_tasks_list_flutter/core/page_state_status.dart';
import 'package:kanban_tasks_list_flutter/domain/entities/task.dart';

part 'tasks_state.freezed.dart';

@freezed
class TasksState with _$TasksState {
  const factory TasksState({
    List<Task>? tasks,
    List<AppFlowyGroupData>? groups,
    String? errorMessage,
    String? syncToken,
    required PageStateStatus status,
  }) = _TasksState;
}
