// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskPostModel _$TaskPostModelFromJson(Map<String, dynamic> json) =>
    TaskPostModel(
      projectId: json['project_id'] as String,
      sectionId: json['section_id'] as String,
      content: json['content'] as String,
      description: json['description'] as String?,
      order: (json['order'] as num?)?.toInt(),
      priority: (json['priority'] as num?)?.toInt(),
      labels:
          (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      dueString: json['due_string'] as String?,
      dueDate: json['due_date'] as String?,
      dueDatetime: json['due_datetime'] as String?,
      dueLang: json['due_lang'] as String?,
    );

Map<String, dynamic> _$TaskPostModelToJson(TaskPostModel instance) =>
    <String, dynamic>{
      'project_id': instance.projectId,
      'section_id': instance.sectionId,
      'content': instance.content,
      'description': instance.description,
      'order': instance.order,
      'priority': instance.priority,
      'labels': instance.labels,
      'due_string': instance.dueString,
      'due_date': instance.dueDate,
      'due_datetime': instance.dueDatetime,
      'due_lang': instance.dueLang,
    };
