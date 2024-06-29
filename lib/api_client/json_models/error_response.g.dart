// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponseModel _$ErrorResponseModelFromJson(Map<String, dynamic> json) =>
    ErrorResponseModel(
      detail: json['detail'] as String?,
      errors: (json['errors'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      extensions: json['extensions'],
      instance: json['instance'] as String?,
      status: (json['status'] as num).toInt(),
      title: json['title'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$ErrorResponseModelToJson(ErrorResponseModel instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'errors': instance.errors,
      'extensions': instance.extensions,
      'instance': instance.instance,
      'status': instance.status,
      'title': instance.title,
      'type': instance.type,
    };
