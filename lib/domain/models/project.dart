import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';

@freezed
class Project with _$Project {
  factory Project({
    required String id,
    required String name,
    required int commentCount,
    required int order,
    required String color,
    required bool isShared,
    required bool isFavorite,
    required bool isInboxProject,
    required bool isTeamInbox,
    required String viewStyle,
    required String? parentId,
    required String url,
  }) = _Project;
}
