
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_tasks_list_flutter/core/page_state_status.dart';

part 'kanban_task_state.freezed.dart';

@freezed
class KanbanTaskState with _$KanbanTaskState {
  const factory KanbanTaskState({
    required PageStateStatus status,
    String? taskId,
    String? timeDurationToDisplay,
    @Default(0) int timeSpentMs,
    @Default(0) int startTimeMs,
    @Default(0) int endTimeMs,
    DateTime? updatedAt,
    @Default(false) bool timeTrackingStarted,
  }) = _KanbanTaskState;
}
