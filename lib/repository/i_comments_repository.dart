import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/domain/models/comment.dart';


abstract class ICommentsRepository {
  Future<Result<List<Comment>>> getComments({required String taskId});
}