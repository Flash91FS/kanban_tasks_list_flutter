import 'package:kanban_tasks_list_flutter/data/apis/apis.dart';
import 'package:kanban_tasks_list_flutter/core/api_error_handler.dart';
import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/domain/irepositories/i_sections_repository.dart';
import 'package:kanban_tasks_list_flutter/domain/entities/section.dart';

class SectionsRepository with ApiErrorHandler implements ISectionsRepository {
  final SectionsApi sectionsApi;

  SectionsRepository({
    required this.sectionsApi,
  });

  @override
  Future<Result<List<Section>>> getSectionsList() {

    return captureApiErrorsAsResultFailure(() async {
      var projectsListResponse =
          await sectionsApi.apiGetSectionsList();
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
