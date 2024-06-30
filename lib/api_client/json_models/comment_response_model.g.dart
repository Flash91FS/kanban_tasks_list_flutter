// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentResponseModel _$CommentResponseModelFromJson(
        Map<String, dynamic> json) =>
    CommentResponseModel(
      id: json['id'] as String,
      content: json['content'] as String,
      postedAt: DateTime.parse(json['posted_at'] as String),
      projectId: json['project_id'] as String?,
      taskId: json['task_id'] as String?,
      attachment: (json['attachment'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$CommentResponseModelToJson(
        CommentResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'posted_at': instance.postedAt.toIso8601String(),
      'project_id': instance.projectId,
      'task_id': instance.taskId,
      'attachment': instance.attachment,
    };
