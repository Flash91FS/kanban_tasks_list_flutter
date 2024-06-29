import 'package:kanban_tasks_list_flutter/api_client/json_models/json_models.dart';
import 'package:kanban_tasks_list_flutter/api_client/json_parsers/json_parser.dart';

class SectionsListResponseModelParser extends JsonParser<List<SectionResponseModel>>
    with ListDecoder<List<SectionResponseModel>> {
  const SectionsListResponseModelParser();

  @override
  List<SectionResponseModel> parseFromJson(String json) {
    return decodeJsonList(json)
        .map((value) => SectionResponseModel.fromJson(value as Map<String, dynamic>))
        .toList();
  }
}