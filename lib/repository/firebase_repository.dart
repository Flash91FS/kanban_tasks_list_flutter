import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kanban_tasks_list_flutter/core/api_error_handler.dart';
import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/repository/i_firebase_repository.dart';

class FirebaseRepository with ApiErrorHandler implements IFirebaseRepository {
  final FirebaseFirestore firestoreInstance;

  const FirebaseRepository({
    required this.firestoreInstance,
  });

  @override
  Future<Result<Map<String, dynamic>?>> getTimeTrackingData(
      {required String taskId}) {
    return captureApiErrorsAsResultFailure(() async {
      final userSnap =
          await firestoreInstance.collection('tasks').doc(taskId).get();
      final data = userSnap.data();
      return Result.success(data: data);
    });
  }

  @override
  Future<Result<String>> postTimeTrackingDataForTask(
      {required String taskId,
      int timeSpentMs = 0,
      int startTimeMs = 0,
      int endTimeMs = 0,
      DateTime? updatedAt,
      bool timeTrackingStarted = false}) {
    return captureApiErrorsAsResultFailure(() async {
      updatedAt ??= DateTime.now();

      firestoreInstance.collection('tasks').doc(taskId).set({
        'taskId': taskId,
        'timeSpentMs': timeSpentMs,
        'startTimeMs': startTimeMs,
        'endTimeMs': endTimeMs,
        'updatedAt': updatedAt,
        'timeTrackingStarted': timeTrackingStarted,
      });
      return const Result.success(data: 'Success');
    });
  }

  @override
  Future<Result<String>> stopTimeTrackingWithoutDetails(
      {required String taskId}) {
    return captureApiErrorsAsResultFailure(() async {
      final DateTime timeNow = DateTime.now();

      final userSnap =
          await firestoreInstance.collection('tasks').doc(taskId).get();

      final data = userSnap.data();
      if (data != null) {
        final int timeSpentMs = data['timeSpentMs'];
        final int startTimeMs = data['startTimeMs'];
        final bool timeTrackingStarted = data['timeTrackingStarted'] as bool;

        if (timeTrackingStarted) {
          final totalTimeSpentMs =
              timeSpentMs + (timeNow.millisecondsSinceEpoch - startTimeMs);

          firestoreInstance.collection('tasks').doc(taskId).set({
            'taskId': taskId,
            'timeSpentMs': totalTimeSpentMs,
            'startTimeMs': 0,
            'endTimeMs': 0,
            'updatedAt': timeNow,
            'timeTrackingStarted': false,
          });
        }
      }
      return const Result.success(data: 'Success');
    });
  }
}
