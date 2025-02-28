import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_tasks_list_flutter/core/page_state_status.dart';
import 'package:kanban_tasks_list_flutter/domain/entities/comment.dart';

part 'comments_state.freezed.dart';

@freezed
class CommentsState with _$CommentsState {
  const factory CommentsState({
    List<Comment>? comments,
    required PageStateStatus status,
    String? errorMessage,
  }) = _CommentsState;
}
