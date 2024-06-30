import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_tasks_list_flutter/domain/models/comment.dart';

part 'comments_state.freezed.dart';

@freezed
class CommentsState with _$CommentsState {
  const factory CommentsState.loaded({
    required List<Comment> allItems,
  }) = Data;

  const factory CommentsState.loading() = Loading;

  const factory CommentsState.failedToLoad() = FailedToLoad;
}
