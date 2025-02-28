import 'package:kanban_tasks_list_flutter/data/response_models/task_response_model.dart';
import 'package:kanban_tasks_list_flutter/data/json_parsers/json_parser.dart';

class TasksListResponseModelParser extends JsonParser<List<TaskResponseModel>>
    with ListDecoder<List<TaskResponseModel>> {
  const TasksListResponseModelParser();

  @override
  List<TaskResponseModel> parseFromJson(String json) {
    return decodeJsonList(json)
        .map((value) => TaskResponseModel.fromJson(value as Map<String, dynamic>))
        .toList();
  }
}
