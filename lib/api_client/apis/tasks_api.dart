import 'package:kanban_tasks_list_flutter/api_client/api_client.dart';
import 'package:kanban_tasks_list_flutter/api_client/api_exception.dart';
import 'package:kanban_tasks_list_flutter/api_client/json_models/json_models.dart';
import 'package:kanban_tasks_list_flutter/api_client/json_parsers/json_parsers.dart';


class TasksApi {
  TasksApi(this.apiClient);

  final ApiClient apiClient;

  Future<List<TaskResponseModel>> apiGetTasksList() async {
    const path = '/tasks';

    try {
      return await apiClient.invokeGet<List<TaskResponseModel>>(
          path: path, parser: const TasksListResponseModelParser());
    } on ApiException catch (e) {
      if (e.code == 404) {
        return [];
      } else {
        rethrow;
      }
    }
  }

  Future<void> apiDeleteTask({required String taskId}) async {
    final path = '/tasks/$taskId';

    try {
      return await apiClient.invokeDelete(path: path);
    } on ApiException catch (e) {
      if (e.code == 404) {
        return;
      } else {
        rethrow;
      }
    }
  }

  // Future<TaskResponseModel> apiPost(TokenPostModel tokenPost) async {
  //   const path = '/...';
  //
  //   return await apiClient.invokePost<TaskResponseModel>(
  //       path: path, body: tokenPost.toJson(), parser: const TaskResponseModelParser());
  // }
}
