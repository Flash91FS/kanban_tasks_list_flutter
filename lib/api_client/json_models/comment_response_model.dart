import 'package:json_annotation/json_annotation.dart';

part 'comment_response_model.g.dart';

@JsonSerializable()
class CommentResponseModel {
  final String id;
  final String content;
  @JsonKey(name: 'posted_at')
  final DateTime postedAt;
  @JsonKey(name: 'project_id')
  final String? projectId;
  @JsonKey(name: 'task_id')
  final String? taskId;

  final Map<String, String>? attachment;

  CommentResponseModel({
    required this.id,
    required this.content,
    required this.postedAt,
    this.projectId,
    this.taskId,
    this.attachment,
  });

  factory CommentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CommentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentResponseModelToJson(this);
}
