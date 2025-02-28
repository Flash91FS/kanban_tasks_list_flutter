import 'package:kanban_tasks_list_flutter/data/json_parsers/json_parser.dart';

class VoidParser extends JsonParser<void> {
  const VoidParser();

  @override
  void parseFromJson(String? json) {}
}
