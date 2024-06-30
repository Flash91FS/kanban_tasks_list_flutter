import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/domain/models/project.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/projects/projects_state.dart';
import 'package:kanban_tasks_list_flutter/repository/i_projects_repository.dart';
import 'package:kanban_tasks_list_flutter/utils.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  final IProjectsRepository projectsRepository;

  ProjectsCubit({required this.projectsRepository})
      : super(const ProjectsState.loading());

  Future<void> loadResults() async {
    try {
      Result<List<Project>> results = await projectsRepository.getProjectsList();
      logData(TAG_PROJECTS_CUBIT, 'results = $results');
      results.when(success: (List<Project> items) {
        logData(TAG_PROJECTS_CUBIT, 'items = $items');
        emit(ProjectsState.loaded(
          allItems: items,
        ));
      }, failure: (_) {
        logData(TAG_PROJECTS_CUBIT, 'failure:');
        emit(const ProjectsState.failedToLoad());
      });
    } on Error {
      logData(TAG_PROJECTS_CUBIT, 'Error:');
      emit(const ProjectsState.failedToLoad());
    } on Exception {
      logData(TAG_PROJECTS_CUBIT, 'Exception:');
      emit(const ProjectsState.failedToLoad());
    }
  }
}
