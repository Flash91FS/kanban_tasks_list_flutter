import 'package:kanban_tasks_list_flutter/data/response_models/response_models.dart';
import 'package:kanban_tasks_list_flutter/data/json_parsers/json_parser.dart';

class SyncResponseModelParser extends JsonParser<SyncResponseModel>
    with ObjectDecoder<SyncResponseModel> {
  const SyncResponseModelParser();

  @override
  SyncResponseModel parseFromJson(String json) {
    final decoded = decodeJsonObject(json);
    return SyncResponseModel.fromJson(decoded);
  }

}
