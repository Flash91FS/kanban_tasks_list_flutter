import 'package:kanban_tasks_list_flutter/data/api_client.dart';
import 'package:kanban_tasks_list_flutter/data/api_exception.dart';
import 'package:kanban_tasks_list_flutter/data/response_models/response_models.dart';
import 'package:kanban_tasks_list_flutter/data/json_parsers/json_parsers.dart';

class ProjectsApi {
  ProjectsApi(this.apiClient);

  final ApiClient apiClient;

  Future<List<ProjectResponseModel>> apiGetProjectsList() async {
    const path = '/rest/v2/projects';

    try {
      return await apiClient.invokeGet<List<ProjectResponseModel>>(
          path: path, parser: const ProjectsListResponseModelParser());
    } on ApiException catch (e) {
      if (e.code == 404) {
        return [];
      } else {
        rethrow;
      }
    }
  }
}
