import 'package:json_annotation/json_annotation.dart';
import 'package:kanban_tasks_list_flutter/data/response_models/due_date_response_model.dart';

part 'task_response_model.g.dart';

@JsonSerializable()
class TaskResponseModel {
  final String id;
  final String content;
  final String description;
  @JsonKey(name: 'comment_count')
  final int commentCount;
  @JsonKey(name: 'is_completed')
  final bool isCompleted;
  final int order;
  final int priority;
  @JsonKey(name: 'project_id')
  final String projectId;
  final List<String> labels;

  DueDateResponseModel? due;

  @JsonKey(name: 'section_id')
  final String? sectionId;

  @JsonKey(name: 'parent_id')
  final String? parentId;

  @JsonKey(name: 'creator_id')
  final String creatorId;

  @JsonKey(name: 'created_at')
  DateTime createdAt;

  @JsonKey(name: 'assignee_id')
  final String? assigneeId;

  @JsonKey(name: 'assigner_id')
  final String? assignerId;

  final String url;

  TaskResponseModel({
    required this.id,
    required this.content,
    required this.description,
    required this.commentCount,
    required this.isCompleted,
    required this.order,
    required this.priority,
    required this.projectId,
    required this.labels,
    this.due,
    this.sectionId,
    this.parentId,
    required this.creatorId,
    required this.createdAt,
    this.assigneeId,
    this.assignerId,
    required String this.url,
  });

  factory TaskResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TaskResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskResponseModelToJson(this);
}
