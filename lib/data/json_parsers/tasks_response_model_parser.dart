import 'package:kanban_tasks_list_flutter/data/response_models/task_response_model.dart';
import 'package:kanban_tasks_list_flutter/data/json_parsers/json_parser.dart';

class TasksResponseModelParser extends JsonParser<TaskResponseModel>
    with ObjectDecoder<TaskResponseModel> {
  const TasksResponseModelParser();

  @override
  TaskResponseModel parseFromJson(String json) {
    final decoded = decodeJsonObject(json);
    return TaskResponseModel.fromJson(decoded);
  }

}
