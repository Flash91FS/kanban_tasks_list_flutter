import 'package:kanban_tasks_list_flutter/api_client/json_models/json_models.dart';
import 'package:kanban_tasks_list_flutter/api_client/json_parsers/json_parser.dart';

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
