import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';

@freezed
class Comment with _$Comment {
  factory Comment({
    required String id,
    required String content,
    required DateTime postedAt,
    required String projectId,
    required String? taskId,
    required Map<String, String>? attachment,
  }) = _Comment;
}
