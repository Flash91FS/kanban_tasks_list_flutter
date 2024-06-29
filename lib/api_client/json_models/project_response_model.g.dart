// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectResponseModel _$ProjectResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProjectResponseModel(
      id: json['id'] as String,
      name: json['name'] as String,
      commentCount: (json['comment_count'] as num).toInt(),
      order: (json['order'] as num).toInt(),
      color: json['color'] as String,
      isShared: json['is_shared'] as bool,
      isFavorite: json['is_favorite'] as bool,
      isInboxProject: json['is_inbox_project'] as bool,
      isTeamInbox: json['is_team_inbox'] as bool,
      viewStyle: json['view_style'] as String,
      parentId: json['parent_id'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$ProjectResponseModelToJson(
        ProjectResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'comment_count': instance.commentCount,
      'order': instance.order,
      'color': instance.color,
      'is_shared': instance.isShared,
      'is_favorite': instance.isFavorite,
      'is_inbox_project': instance.isInboxProject,
      'is_team_inbox': instance.isTeamInbox,
      'view_style': instance.viewStyle,
      'parent_id': instance.parentId,
      'url': instance.url,
    };
