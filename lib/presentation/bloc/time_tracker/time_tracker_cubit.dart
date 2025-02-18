import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/core/page_state_status.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/time_tracker/time_tracker_state.dart';
import 'package:kanban_tasks_list_flutter/repository/i_firebase_repository.dart';
import 'package:kanban_tasks_list_flutter/utils.dart';

class TimeTrackerCubit extends Cubit<TimeTrackerState> { //testing a minor change
  final IFirebaseRepository firebaseRepository;

  TimeTrackerCubit({required this.firebaseRepository})
      : super(const TimeTrackerState(status: PageStateStatus.initial));

  Future<void> loadData(String itemId) async {
    try {
      Result<Map<String, dynamic>?> result =
          await firebaseRepository.getTimeTrackingData(taskId: itemId);
      result.when(success: (Map<String, dynamic>? data) async {
        if (data != null) {
          final taskId = data['taskId'];
          final timeSpentMs = data['timeSpentMs'];
          final startTimeMs = data['startTimeMs'];
          final endTimeMs = data['endTimeMs'];
          final DateTime updatedAt = (data['updatedAt'] as Timestamp).toDate();
          final timeTrackingStarted = data['timeTrackingStarted'];

          final endTimeForCalculation = timeTrackingStarted
              ? DateTime.now().millisecondsSinceEpoch
              : endTimeMs;
          final totalTimeSpentMs =
              timeSpentMs + (endTimeForCalculation - startTimeMs);

          String timeDurationToDisplay =
              durationToString(Duration(milliseconds: totalTimeSpentMs));

          emit(TimeTrackerState(
            status: PageStateStatus.loaded,
            taskId: taskId,
            timeSpentMs: timeSpentMs,
            startTimeMs: startTimeMs,
            endTimeMs: endTimeMs,
            updatedAt: updatedAt,
            timeTrackingStarted: timeTrackingStarted,
            timeDurationToDisplay: timeDurationToDisplay,
          ));
        } else {
          emit(const TimeTrackerState(
            status: PageStateStatus.failedToLoad,
          ));
        }
      }, failure: (_) {
        emit(const TimeTrackerState(
          status: PageStateStatus.failedToLoad,
        ));
      });
    } catch (ex) {
      logData(
          TAG_KANBAN_TASK_CUBIT, 'loadData(): Exception = ${ex.toString()}');
    }
  }

  Future<void> startTimeTracking({required String taskId}) async {
    const bool timeTrackingStarted = true;
    final int timeAlreadySpent = state.timeSpentMs;
    final startTimeMs = DateTime.now().millisecondsSinceEpoch;
    await firebaseRepository.postTimeTrackingDataForTask(
      taskId: taskId,
      timeTrackingStarted: timeTrackingStarted,
      startTimeMs: startTimeMs,
      endTimeMs: 0,
      timeSpentMs: timeAlreadySpent,
      updatedAt: DateTime.now(),
    );

    emit(state.copyWith(
      status: PageStateStatus.updated,
      timeSpentMs: timeAlreadySpent,
      startTimeMs: startTimeMs,
      updatedAt: DateTime.now(),
      timeTrackingStarted: timeTrackingStarted,
    ));
  }

  Future<void> stopTimeTracking({required String taskId}) async {
    const bool timeTrackingStarted = false;
    final int timeAlreadySpent = state.timeSpentMs;
    final startTimeMs = state.startTimeMs;
    final endTimeMs = DateTime.now().millisecondsSinceEpoch;

    final totalTimeSpentMs = timeAlreadySpent + (endTimeMs - startTimeMs);
    await firebaseRepository.postTimeTrackingDataForTask(
      taskId: taskId,
      timeTrackingStarted: timeTrackingStarted,
      startTimeMs: 0,
      endTimeMs: 0,
      timeSpentMs: totalTimeSpentMs,
      updatedAt: DateTime.now(),
    );

    String timeDurationToDisplay =
        durationToString(Duration(milliseconds: totalTimeSpentMs));

    emit(state.copyWith(
      status: PageStateStatus.updated,
      timeSpentMs: totalTimeSpentMs,
      startTimeMs: startTimeMs,
      updatedAt: DateTime.now(),
      timeTrackingStarted: timeTrackingStarted,
      timeDurationToDisplay: timeDurationToDisplay,
    ));
  }

  String durationToString(Duration duration) {
    var components = <String>[];

    var days = duration.inDays;
    if (days != 0) {
      components.add('${days}d ');
    }
    var hours = duration.inHours % 24;
    if (hours != 0) {
      components.add('${hours}h ');
    }
    var minutes = duration.inMinutes % 60;
    if (minutes != 0) {
      components.add('${minutes}m ');
    }

    var seconds = duration.inSeconds % 60;
    var centiseconds = (duration.inMilliseconds % 1000) ~/ 10;
    if (components.isEmpty || seconds != 0 || centiseconds != 0) {
      components.add('$seconds');
      components.add('s');
    }
    return components.join();
  }
}
