import 'package:json_annotation/json_annotation.dart';

part 'project_response_model.g.dart';

@JsonSerializable()
class ProjectResponseModel {
  final String id;
  final String name;
  @JsonKey(name: 'comment_count')
  final int commentCount;
  final int order;
  final String color;
  @JsonKey(name: 'is_shared')
  final bool isShared;
  @JsonKey(name: 'is_favorite')
  final bool isFavorite;
  @JsonKey(name: 'is_inbox_project')
  final bool isInboxProject;
  @JsonKey(name: 'is_team_inbox')
  final bool isTeamInbox;
  @JsonKey(name: 'view_style')
  final String viewStyle;
  @JsonKey(name: 'parent_id')
  final String? parentId;

  final String url;

  ProjectResponseModel({
    required this.id,
    required this.name,
    required this.commentCount,
    required this.order,
    required this.color,
    required this.isShared,
    required this.isFavorite,
    required this.isInboxProject,
    required this.isTeamInbox,
    required this.viewStyle,
    this.parentId,
    required this.url,
  });

  factory ProjectResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectResponseModelToJson(this);
}
