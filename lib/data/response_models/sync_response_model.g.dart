// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncResponseModel _$SyncResponseModelFromJson(Map<String, dynamic> json) =>
    SyncResponseModel(
      fullSync: json['full_sync'] as bool,
      syncToken: json['sync_token'] as String,
    );

Map<String, dynamic> _$SyncResponseModelToJson(SyncResponseModel instance) =>
    <String, dynamic>{
      'full_sync': instance.fullSync,
      'sync_token': instance.syncToken,
    };
