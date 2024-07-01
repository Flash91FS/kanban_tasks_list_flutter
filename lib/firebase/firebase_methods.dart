import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kanban_tasks_list_flutter/utils.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // post Task
  Future<String> postTask(
      {required String taskId,
      int timeSpentMs = 0,
      int startTimeMs = 0,
      int endTimeMs = 0,
      DateTime? updatedAt,
      bool timeTrackingStarted = false}) async {
    String res = "Some error occurred";
    try {
      updatedAt ??= DateTime.now();

      _firestore.collection('tasks').doc(taskId).set({
        'taskId': taskId,
        'timeSpentMs': timeSpentMs,
        'startTimeMs': startTimeMs,
        'endTimeMs': endTimeMs,
        'updatedAt': updatedAt,
        'timeTrackingStarted': timeTrackingStarted,
      });
      res = 'success';
    } catch (err) {
      res = err.toString();
      logData('FirebaseMethods', 'postTask() : Exception : ${err.toString()}');
    }
    return res;
  }

  // stop TimeTracking Without Details
  Future<String> stopTimeTrackingWithoutDetails(
      {required String taskId}) async {
    String res = "Some error occurred";
    try {
      final DateTime timeNow = DateTime.now();

      final userSnap = await _firestore.collection('tasks').doc(taskId).get();

      final data = userSnap.data();
      if (data != null) {
        final int timeSpentMs = data['timeSpentMs'];
        final int startTimeMs = data['startTimeMs'];
        final bool timeTrackingStarted = data['timeTrackingStarted'] as bool;

        if (timeTrackingStarted) {
          final totalTimeSpentMs =
              timeSpentMs + (timeNow.millisecondsSinceEpoch - startTimeMs);

          _firestore.collection('tasks').doc(taskId).set({
            'taskId': taskId,
            'timeSpentMs': totalTimeSpentMs,
            'startTimeMs': 0,
            'endTimeMs': 0,
            'updatedAt': timeNow,
            'timeTrackingStarted': false,
          });
        }
      }
      res = 'success';
    } catch (err) {
      res = err.toString();
      logData('FirebaseMethods', 'stopTimeTrackingWithoutDetails() : Exception : ${err.toString()}');
    }
    return res;
  }
}
