import 'package:kanban_tasks_list_flutter/api_client/api_client.dart';
import 'package:kanban_tasks_list_flutter/api_client/api_exception.dart';

import '../json_models/tasks_list_response_model.dart';
import '../json_parsers/tasks_list_response_model_parser.dart';

class TasksListApi {
  TasksListApi(this.apiClient);

  final ApiClient apiClient;

  Future<List<TasksListResponseModel>> apiGetTasksList() async {
    const path = '/tasks';

    try {
      return await apiClient.invokeGet<List<TasksListResponseModel>>(
          path: path, parser: const TasksListResponseModelParser());
    } on ApiException catch (e) {
      if (e.code == 404) {
        return [];
      } else {
        rethrow;
      }
    }
  }

  // Future<TasksListResponseModel> apiPost(TokenPostModel tokenPost) async {
  //   const path = '/...';
  //
  //   return await apiClient.invokePost<TasksListResponseModel>(
  //       path: path, body: tokenPost.toJson(), parser: const TasksListResponseModelParser());
  // }
}
