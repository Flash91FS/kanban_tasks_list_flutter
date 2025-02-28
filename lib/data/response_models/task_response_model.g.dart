// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskResponseModel _$TaskResponseModelFromJson(Map<String, dynamic> json) =>
    TaskResponseModel(
      id: json['id'] as String,
      content: json['content'] as String,
      description: json['description'] as String,
      commentCount: (json['comment_count'] as num).toInt(),
      isCompleted: json['is_completed'] as bool,
      order: (json['order'] as num).toInt(),
      priority: (json['priority'] as num).toInt(),
      projectId: json['project_id'] as String,
      labels:
          (json['labels'] as List<dynamic>).map((e) => e as String).toList(),
      due: json['due'] == null
          ? null
          : DueDateResponseModel.fromJson(json['due'] as Map<String, dynamic>),
      sectionId: json['section_id'] as String?,
      parentId: json['parent_id'] as String?,
      creatorId: json['creator_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      assigneeId: json['assignee_id'] as String?,
      assignerId: json['assigner_id'] as String?,
      url: json['url'] as String,
    );

Map<String, dynamic> _$TaskResponseModelToJson(TaskResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'description': instance.description,
      'comment_count': instance.commentCount,
      'is_completed': instance.isCompleted,
      'order': instance.order,
      'priority': instance.priority,
      'project_id': instance.projectId,
      'labels': instance.labels,
      'due': instance.due,
      'section_id': instance.sectionId,
      'parent_id': instance.parentId,
      'creator_id': instance.creatorId,
      'created_at': instance.createdAt.toIso8601String(),
      'assignee_id': instance.assigneeId,
      'assigner_id': instance.assignerId,
      'url': instance.url,
    };
