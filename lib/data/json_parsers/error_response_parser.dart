import 'package:kanban_tasks_list_flutter/data/response_models/error_response.dart';
import 'package:kanban_tasks_list_flutter/data/json_parsers/json_parser.dart';

class ErrorResponseModelParser extends JsonParser<ErrorResponseModel>
    with ObjectDecoder<ErrorResponseModel> {
  const ErrorResponseModelParser();

  @override
  ErrorResponseModel parseFromJson(String json) {
    final decoded = decodeJsonObject(json);
    return ErrorResponseModel.fromJson(decoded);
  }
}
