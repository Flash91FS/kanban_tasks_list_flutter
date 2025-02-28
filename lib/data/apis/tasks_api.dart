import 'package:kanban_tasks_list_flutter/data/api_client.dart';
import 'package:kanban_tasks_list_flutter/data/api_exception.dart';
import 'package:kanban_tasks_list_flutter/data/response_models/response_models.dart';
import 'package:kanban_tasks_list_flutter/data/json_parsers/json_parsers.dart';
import 'package:kanban_tasks_list_flutter/data/json_parsers/tasks_response_model_parser.dart';

class TasksApi {
  TasksApi(this.apiClient);

  final ApiClient apiClient;

  Future<List<TaskResponseModel>> apiGetTasksList() async {
    const path = '/rest/v2/tasks';
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
    final path = '/rest/v2/tasks/$taskId';
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

  Future<TaskResponseModel> apiPostAddTask(TaskPostModel taskPost) async {
    const path = '/rest/v2/tasks';
    return await apiClient.invokePost<TaskResponseModel>(
        path: path,
        body: taskPost.toJson(),
        parser: const TasksResponseModelParser());
  }

  Future<TaskResponseModel> apiPostUpdateTask(
      {required String taskId, required TaskUpdateModel taskPost}) async {
    final path = '/rest/v2/tasks/$taskId';
    return await apiClient.invokePost<TaskResponseModel>(
        path: path,
        body: taskPost.toJson(),
        parser: const TasksResponseModelParser());
  }

  Future<SyncResponseModel?> apiPostSyncState() async {
    const path = '/sync/v9/sync';
    try {
      return await apiClient.invokePost<SyncResponseModel>(
          path: path,
          body: {
            "sync_token": "*",
            "resource_types": ["projects"],
          },
          parser: const SyncResponseModelParser());
    } on ApiException catch (e) {
      if (e.code == 404) {
        return null;
      } else {
        rethrow;
      }
    }
  }

  Future<SyncResponseModel?> apiPostSyncItemMove({
    required String syncToken,
    required String uuid,
    required String taskId,
    required String toSectionId,
  }) async {
    const path = '/sync/v9/sync';
    try {
      return await apiClient.invokePost<SyncResponseModel>(
          path: path,
          body: {
            "sync_token": syncToken,
            "commands": [
              {
                "type": "item_move",
                "uuid": uuid,
                "args": {"id": taskId,
                  "section_id": toSectionId,
                }
              }
            ]
          },
          parser: const SyncResponseModelParser());
    } on ApiException catch (e) {
      if (e.code == 404) {
        return null;
      } else {
        rethrow;
      }
    }
  }
}
