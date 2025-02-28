import 'package:kanban_tasks_list_flutter/data/response_models/response_models.dart';
import 'package:kanban_tasks_list_flutter/data/json_parsers/json_parser.dart';

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