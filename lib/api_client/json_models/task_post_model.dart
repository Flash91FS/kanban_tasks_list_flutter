import 'package:json_annotation/json_annotation.dart';

part 'task_post_model.g.dart';

@JsonSerializable()
class TaskPostModel {

  //{"content": "Buy Milk", "due_string": "tomorrow at 12:00", "due_lang": "en", "priority": 4 ....}
  // "date": "2024-06-28",
  // "string": "Jun 28",
  // "lang": "en",

  @JsonKey(name: 'project_id')
  final String projectId;
  @JsonKey(name: 'section_id')
  final String sectionId;
  final String content;
  final String? description;
  final int? order;
  final int? priority;
  final List<String>? labels;

  @JsonKey(name: 'due_string')
  String? dueString;
  @JsonKey(name: 'due_date')
  String? dueDate;
  @JsonKey(name: 'due_datetime')
  String? dueDatetime;
  @JsonKey(name: 'due_lang')
  String? dueLang;

  TaskPostModel({
    required this.projectId,
    required this.sectionId,
    required this.content,
    this.description,
    this.order,
    this.priority,
    this.labels,
    this.dueString,
    this.dueDate,
    this.dueDatetime,
    this.dueLang,
  });

  factory TaskPostModel.fromJson(Map<String, dynamic> json) =>
      _$TaskPostModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskPostModelToJson(this);
}
