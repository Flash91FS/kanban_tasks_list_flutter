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
  final String parentId;

  final String url;

  ProjectResponseModel({
    required String this.id,
    required String this.name,
    required int this.commentCount,
    required int this.order,
    required String this.color,
    required bool this.isShared,
    required bool this.isFavorite,
    required bool this.isInboxProject,
    required bool this.isTeamInbox,
    required String this.viewStyle,
    required String this.parentId,
    required String this.url,
  });

  factory ProjectResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectResponseModelToJson(this);
}
