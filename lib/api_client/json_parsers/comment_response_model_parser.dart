import 'package:kanban_tasks_list_flutter/api_client/json_models/json_models.dart';
import 'package:kanban_tasks_list_flutter/api_client/json_parsers/json_parser.dart';

class CommentResponseModelParser extends JsonParser<CommentResponseModel>
    with ObjectDecoder<CommentResponseModel> {
  const CommentResponseModelParser();

  @override
  CommentResponseModel parseFromJson(String json) {
    final decoded = decodeJsonObject(json);
    return CommentResponseModel.fromJson(decoded);
  }

}
