import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/domain/entities/project.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/projects/projects_state.dart';
import 'package:kanban_tasks_list_flutter/domain/irepositories/i_projects_repository.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  final IProjectsRepository projectsRepository;

  ProjectsCubit({required this.projectsRepository})
      : super(const ProjectsState.loading());

  Future<void> loadResults() async {
    try {
      Result<List<Project>> results = await projectsRepository.getProjectsList();
      results.when(success: (List<Project> items) {
        emit(ProjectsState.loaded(allItems: items));
      }, failure: (_) {
        emit(const ProjectsState.failedToLoad());
      });
    } on Error {
      emit(const ProjectsState.failedToLoad());
    } on Exception {
      emit(const ProjectsState.failedToLoad());
    }
  }
}
