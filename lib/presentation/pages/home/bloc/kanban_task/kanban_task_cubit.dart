import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/core/page_state_status.dart';
import 'package:kanban_tasks_list_flutter/firebase/firebase_methods.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/bloc/kanban_task/kanban_task_state.dart';
import 'package:kanban_tasks_list_flutter/utils.dart';

class KanbanTaskCubit extends Cubit<KanbanTaskState> {
  KanbanTaskCubit()
      : super(const KanbanTaskState(status: PageStateStatus.initial));

  Future<void> loadData(String itemId) async {
    logData('KanbanTaskCubit', 'loadData(): itemId = $itemId');
    try {
      //Todo make a call to repository/api instead of directly calling FireStore Methods
      final userSnap = await FirebaseFirestore.instance
          .collection('tasks')
          .doc(itemId)
          .get();
      final data = userSnap.data();
      if (data != null) {
        logData('KanbanTaskCubit', 'loadData(): data = $data');
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
            prettyDuration(Duration(milliseconds: totalTimeSpentMs));
        logData('KanbanTaskCubit',
            'loadData(): timeDurationToDisplay = $timeDurationToDisplay');

        emit(KanbanTaskState(
          status: PageStateStatus.loaded,
          taskId: taskId,
          timeSpentMs: timeSpentMs,
          startTimeMs: startTimeMs,
          endTimeMs: endTimeMs,
          updatedAt: updatedAt,
          timeTrackingStarted: timeTrackingStarted,
          timeDurationToDisplay: timeDurationToDisplay,
        ));
      }
    } catch (ex) {
      logData('KanbanTaskCubit', 'loadData(): Exception = ${ex.toString()}');
    }
  }

  Future<void> startTimeTracking({required String taskId}) async {
    const bool timeTrackingStarted = true;
    final int timeAlreadySpent = state.timeSpentMs;
    final startTimeMs = DateTime.now().millisecondsSinceEpoch;
    //Todo make a call to repository/api instead of directly calling FireStore Methods
    String res = await FireStoreMethods().postTask(
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
    logData('KanbanTaskCubit', 'startTimeTracking(): res = $res');
  }

  Future<void> stopTimeTracking({required String taskId}) async {
    const bool timeTrackingStarted = false;
    final int timeAlreadySpent = state.timeSpentMs;
    final startTimeMs = state.startTimeMs;
    final endTimeMs = DateTime.now().millisecondsSinceEpoch;

    final totalTimeSpentMs = timeAlreadySpent + (endTimeMs - startTimeMs);
    //Todo make a call to repository/api instead of directly calling FireStore Methods
    String res = await FireStoreMethods().postTask(
      taskId: taskId,
      timeTrackingStarted: timeTrackingStarted,
      startTimeMs: 0,
      endTimeMs: 0,
      timeSpentMs: totalTimeSpentMs,
      updatedAt: DateTime.now(),
    );

    String timeDurationToDisplay =
        prettyDuration(Duration(milliseconds: totalTimeSpentMs));
    logData('KanbanTaskCubit',
        'stopTimeTracking(): timeDurationToDisplay = $timeDurationToDisplay');
    emit(state.copyWith(
      status: PageStateStatus.updated,
      timeSpentMs: totalTimeSpentMs,
      startTimeMs: startTimeMs,
      updatedAt: DateTime.now(),
      timeTrackingStarted: timeTrackingStarted,
      timeDurationToDisplay: timeDurationToDisplay,
    ));

    logData('KanbanTaskCubit', 'startTimeTracking(): res = $res');
  }

  String prettyDuration(Duration duration) {
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
      // if (centiseconds != 0) {
      //   components.add('.');
      //   components.add(centiseconds.toString().padLeft(2, '0'));
      // }
      components.add('s');
    }
    return components.join();
  }
}
