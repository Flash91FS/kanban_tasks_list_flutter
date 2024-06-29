import 'package:kanban_tasks_list_flutter/api_client/api_client.dart';
import 'package:kanban_tasks_list_flutter/api_client/apis/apis.dart';
import 'package:kanban_tasks_list_flutter/core/api_error_handler.dart';
import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/domain/models/section.dart';
import 'package:kanban_tasks_list_flutter/repository/i_sections_repository.dart';

class SectionsRepository with ApiErrorHandler implements ISectionsRepository {
  final SectionsApi _sectionsApi;

  SectionsRepository({
    required ApiClient apiClient,
  }) : _sectionsApi = SectionsApi(apiClient);

  @override
  Future<Result<List<Section>>> getSectionsList() {
    return captureApiErrorsAsResultFailure(() async {
      var projectsListResponse =
          await _sectionsApi.apiGetSectionsList();
      return Result.success(
          data: projectsListResponse
              .map(
                (model) => Section(
                  id: model.id,
                  name: model.name,
                  projectId: model.projectId,
                  order: model.order,
                ),
              )
              .toList());
    });
  }
}
