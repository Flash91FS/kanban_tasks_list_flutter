import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/domain/entities/project.dart';


abstract class IProjectsRepository {
  Future<Result<List<Project>>> getProjectsList();
}