import 'package:kanban_tasks_list_flutter/data/response_models/response_models.dart';
import 'package:kanban_tasks_list_flutter/data/json_parsers/json_parser.dart';

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