import 'package:kanban_tasks_list_flutter/api_client/json_models/task_response_model.dart';
import 'package:kanban_tasks_list_flutter/api_client/json_parsers/json_parser.dart';

class TasksListResponseModelParser extends JsonParser<List<TaskResponseModel>>
    // with ObjectDecoder<TaskResponseModel> {
    with ListDecoder<List<TaskResponseModel>> {
  const TasksListResponseModelParser();

  // @override
  // TaskResponseModel parseFromJson(String json) {
  //   final decoded = decodeJsonObject(json);
  //   return TaskResponseModel.fromJson(decoded);
  // }

  @override
  List<TaskResponseModel> parseFromJson(String json) {
    return decodeJsonList(json)
        .map((value) => TaskResponseModel.fromJson(value as Map<String, dynamic>))
        .toList();
  }
}
