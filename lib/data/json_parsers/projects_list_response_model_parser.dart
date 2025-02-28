import 'package:kanban_tasks_list_flutter/data/response_models/response_models.dart';
import 'package:kanban_tasks_list_flutter/data/json_parsers/json_parser.dart';

class ProjectsListResponseModelParser extends JsonParser<List<ProjectResponseModel>>
    with ListDecoder<List<ProjectResponseModel>> {
  const ProjectsListResponseModelParser();

  @override
  List<ProjectResponseModel> parseFromJson(String json) {
    return decodeJsonList(json)
        .map((value) => ProjectResponseModel.fromJson(value as Map<String, dynamic>))
        .toList();
  }
}
