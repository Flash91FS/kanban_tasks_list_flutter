import 'package:kanban_tasks_list_flutter/api_client/api_client.dart';
import 'package:kanban_tasks_list_flutter/api_client/api_exception.dart';
import 'package:kanban_tasks_list_flutter/api_client/json_models/json_models.dart';
import 'package:kanban_tasks_list_flutter/api_client/json_parsers/json_parsers.dart';


class CommentsApi {
  CommentsApi(this.apiClient);

  final ApiClient apiClient;

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
