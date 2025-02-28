import 'package:kanban_tasks_list_flutter/data/api_client.dart';
import 'package:kanban_tasks_list_flutter/data/api_exception.dart';
import 'package:kanban_tasks_list_flutter/data/response_models/response_models.dart';
import 'package:kanban_tasks_list_flutter/data/json_parsers/json_parsers.dart';


class CommentsApi {
  CommentsApi(this.apiClient);

  final ApiClient apiClient;


  Future<CommentResponseModel?> apiPostAddComment({
    required String taskId,
    required String content,
  }) async {
    const path = '/rest/v2/comments';
    try {
      return await apiClient.invokePost<CommentResponseModel>(
          path: path,
          body: {
            "task_id": taskId,
            "content": content
          },
          parser: const CommentResponseModelParser());
    } on ApiException catch (e) {
      if (e.code == 404) {
        return null;
      } else {
        rethrow;
      }
    }
  }

  Future<List<CommentResponseModel>> apiGetCommentsForTask(String taskId) async {
    final path = '/rest/v2/comments?task_id=$taskId';

    try {
      return await apiClient.invokeGet<List<CommentResponseModel>>(
          path: path, parser: const CommentsListResponseModelParser());
    } on ApiException catch (e) {
      if (e.code == 404) {
        return [];
      } else {
        rethrow;
      }
    }
  }
}
