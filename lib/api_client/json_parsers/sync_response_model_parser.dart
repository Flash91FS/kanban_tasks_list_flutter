import 'package:kanban_tasks_list_flutter/api_client/json_models/json_models.dart';
import 'package:kanban_tasks_list_flutter/api_client/json_parsers/json_parser.dart';

class SyncResponseModelParser extends JsonParser<SyncResponseModel>
    with ObjectDecoder<SyncResponseModel> {
  const SyncResponseModelParser();

  @override
  SyncResponseModel parseFromJson(String json) {
    final decoded = decodeJsonObject(json);
    return SyncResponseModel.fromJson(decoded);
  }

}
