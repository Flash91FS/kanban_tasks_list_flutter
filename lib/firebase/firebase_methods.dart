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
}
