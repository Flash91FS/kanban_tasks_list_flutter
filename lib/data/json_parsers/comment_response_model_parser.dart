import 'package:kanban_tasks_list_flutter/data/response_models/response_models.dart';
import 'package:kanban_tasks_list_flutter/data/json_parsers/json_parser.dart';

class CommentResponseModelParser extends JsonParser<CommentResponseModel>
    with ObjectDecoder<CommentResponseModel> {
  const CommentResponseModelParser();

  @override
  CommentResponseModel parseFromJson(String json) {
    final decoded = decodeJsonObject(json);
    return CommentResponseModel.fromJson(decoded);
  }

}
