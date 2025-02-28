// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskUpdateModel _$TaskUpdateModelFromJson(Map<String, dynamic> json) =>
    TaskUpdateModel(
      content: json['content'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$TaskUpdateModelToJson(TaskUpdateModel instance) =>
    <String, dynamic>{
      'content': instance.content,
      'description': instance.description,
    };
