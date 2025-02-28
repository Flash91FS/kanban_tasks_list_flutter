// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionResponseModel _$SectionResponseModelFromJson(
        Map<String, dynamic> json) =>
    SectionResponseModel(
      id: json['id'] as String,
      projectId: json['project_id'] as String,
      name: json['name'] as String,
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$SectionResponseModelToJson(
        SectionResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectId,
      'order': instance.order,
      'name': instance.name,
    };
