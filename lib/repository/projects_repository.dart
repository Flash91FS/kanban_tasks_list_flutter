import 'package:kanban_tasks_list_flutter/api_client/api_client.dart';
import 'package:kanban_tasks_list_flutter/core/api_error_handler.dart';
import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/api_client/apis/apis.dart';
import 'package:kanban_tasks_list_flutter/domain/models/project.dart';
import 'package:kanban_tasks_list_flutter/repository/i_projects_repository.dart';

class ProjectsRepository with ApiErrorHandler implements IProjectsRepository {
  final ProjectsApi _projectsApi;

  ProjectsRepository({
    required ApiClient apiClient,
  }) : _projectsApi = ProjectsApi(apiClient);

  @override
  Future<Result<List<Project>>> getProjectsList() {
    return captureApiErrorsAsResultFailure(() async {
      var projectsListResponse = await _projectsApi.apiGetProjectsList();
      return Result.success(
          data: projectsListResponse
              .map(
                (model) => Project(
                  id: model.id,
                  name: model.name,
                  commentCount: model.commentCount,
                  order: model.order,
                  color: model.color,
                  isShared: model.isShared,
                  isFavorite: model.isFavorite,
                  isInboxProject: model.isInboxProject,
                  isTeamInbox: model.isTeamInbox,
                  viewStyle: model.viewStyle,
                  parentId: model.parentId,
                  url: model.url,
                ),
              )
              .toList());
    });
  }
}
