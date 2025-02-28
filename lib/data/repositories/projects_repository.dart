import 'package:kanban_tasks_list_flutter/data/apis/apis.dart';
import 'package:kanban_tasks_list_flutter/core/api_error_handler.dart';
import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/domain/irepositories/i_projects_repository.dart';
import 'package:kanban_tasks_list_flutter/domain/entities/project.dart';

class ProjectsRepository with ApiErrorHandler implements IProjectsRepository {
  final ProjectsApi projectsApi;

  ProjectsRepository({
    required this.projectsApi,
  });

  @override
  Future<Result<List<Project>>> getProjectsList() {
    return captureApiErrorsAsResultFailure(() async {
      var projectsListResponse = await projectsApi.apiGetProjectsList();
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
