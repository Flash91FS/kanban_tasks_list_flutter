import 'package:kanban_tasks_list_flutter/api_client/api_client.dart';
import 'package:kanban_tasks_list_flutter/api_client/api_exception.dart';
import 'package:kanban_tasks_list_flutter/api_client/json_models/json_models.dart';
import 'package:kanban_tasks_list_flutter/api_client/json_parsers/json_parsers.dart';


class SectionsApi {
  SectionsApi(this.apiClient);

  final ApiClient apiClient;

  Future<List<SectionResponseModel>> apiGetSectionsList() async {
    const path = '/rest/v2/sections';

    try {
      return await apiClient.invokeGet<List<SectionResponseModel>>(
          path: path, parser: const SectionsListResponseModelParser());
    } on ApiException catch (e) {
      if (e.code == 404) {
        return [];
      } else {
        rethrow;
      }
    }
  }
}
