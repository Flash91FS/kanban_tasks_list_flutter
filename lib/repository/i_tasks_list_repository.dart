import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/domain/models/task.dart';


abstract class ITasksListRepository {
  Future<Result<List<Task>>> getTasksList();
}