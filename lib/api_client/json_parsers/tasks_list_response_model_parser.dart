import 'package:kanban_tasks_list_flutter/api_client/json_models/tasks_list_response_model.dart';
import 'package:kanban_tasks_list_flutter/api_client/json_parsers/json_parser.dart';

class TasksListResponseModelParser extends JsonParser<List<TasksListResponseModel>>
    // with ObjectDecoder<TasksListResponseModel> {
    with ListDecoder<List<TasksListResponseModel>> {
  const TasksListResponseModelParser();

  // @override
  // TasksListResponseModel parseFromJson(String json) {
  //   final decoded = decodeJsonObject(json);
  //   return TasksListResponseModel.fromJson(decoded);
  // }

  @override
  List<TasksListResponseModel> parseFromJson(String json) {
    return decodeJsonList(json)
        .map((value) => TasksListResponseModel.fromJson(value as Map<String, dynamic>))
        .toList();
  }
}
