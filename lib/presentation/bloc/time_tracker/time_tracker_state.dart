
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_tasks_list_flutter/core/page_state_status.dart';

part 'time_tracker_state.freezed.dart';

@freezed
class TimeTrackerState with _$TimeTrackerState {
  const factory TimeTrackerState({
    required PageStateStatus status,
    String? taskId,
    String? timeDurationToDisplay,
    @Default(0) int timeSpentMs,
    @Default(0) int startTimeMs,
    @Default(0) int endTimeMs,
    DateTime? updatedAt,
    @Default(false) bool timeTrackingStarted,
  }) = _TimeTrackerState;
}
