import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/domain/models/task.dart';


abstract class ITasksRepository {
  Future<Result<List<Task>>> getTasksList();
  Future<Result<String>> deleteTask({required String taskId});
}