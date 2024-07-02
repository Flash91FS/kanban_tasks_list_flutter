import 'package:kanban_tasks_list_flutter/core/models/result.dart';

abstract class IFirebaseRepository {
  Future<Result<Map<String, dynamic>?>> getTimeTrackingData(
      {required String taskId});

  Future<Result<String>> postTimeTrackingDataForTask(
      {required String taskId,
      int timeSpentMs = 0,
      int startTimeMs = 0,
      int endTimeMs = 0,
      DateTime? updatedAt,
      bool timeTrackingStarted = false});

  Future<Result<String>> stopTimeTrackingWithoutDetails(
      {required String taskId});
}
