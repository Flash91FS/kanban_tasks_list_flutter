import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/domain/models/section.dart';


abstract class ISectionsRepository {
  Future<Result<List<Section>>> getSectionsList();
}