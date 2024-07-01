import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/domain/models/task.dart';

abstract class ITasksRepository {
  Future<Result<String>> loadSyncState();

  Future<Result<String>> moveTaskToSection({
    required String syncToken,
    required String uuid,
    required String taskId,
    required String toSectionId,
  });

  Future<Result<List<Task>>> getTasksList();

  Future<Result<String>> deleteTask({required String taskId});

  Future<Result<Task>> addNewTask({
    required String projectId,
    required String sectionId,
    required String title,
    required String description,
  });

  Future<Result<Task>> updateTask({
    required String taskId,
    required String title,
    required String description,
  });
}
