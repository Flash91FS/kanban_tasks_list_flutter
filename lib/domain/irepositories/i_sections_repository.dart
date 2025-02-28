import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/domain/entities/section.dart';


abstract class ISectionsRepository {
  Future<Result<List<Section>>> getSectionsList();
}