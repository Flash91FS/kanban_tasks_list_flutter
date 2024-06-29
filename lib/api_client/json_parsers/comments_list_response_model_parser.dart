import 'package:kanban_tasks_list_flutter/api_client/json_models/json_models.dart';
import 'package:kanban_tasks_list_flutter/api_client/json_parsers/json_parser.dart';

class CommentsListResponseModelParser extends JsonParser<List<CommentResponseModel>>
    with ListDecoder<List<CommentResponseModel>> {
  const CommentsListResponseModelParser();

  @override
  List<CommentResponseModel> parseFromJson(String json) {
    return decodeJsonList(json)
        .map((value) => CommentResponseModel.fromJson(value as Map<String, dynamic>))
        .toList();
  }
}