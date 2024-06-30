import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_tasks_list_flutter/domain/models/project.dart';

part 'projects_state.freezed.dart';

@freezed
class ProjectsState with _$ProjectsState {
  const factory ProjectsState.loaded({
    required List<Project> allItems,
  }) = Data;

  const factory ProjectsState.loading() = Loading;

  const factory ProjectsState.failedToLoad() = FailedToLoad;
}
