import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/core/page_state_status.dart';
import 'package:kanban_tasks_list_flutter/domain/models/comment.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/comments/comments_state.dart';
import 'package:kanban_tasks_list_flutter/repository/i_comments_repository.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final ICommentsRepository commentsRepository;

  CommentsCubit({required this.commentsRepository})
      : super(const CommentsState(status: PageStateStatus.loading));

  Future<void> loadComments({required String taskId}) async {
    try {
      emit(const CommentsState(
        status: PageStateStatus.loading,
        comments: [],
      ));
      Result<List<Comment>> results =
          await commentsRepository.getComments(taskId: taskId);
      results.when(success: (List<Comment> items) {
        emit(state.copyWith(
          status: PageStateStatus.loaded,
          comments: items,
        ));
      }, failure: (_) {
        emit(state.copyWith(
          status: PageStateStatus.failedToUpdate,
          errorMessage: 'Failed to update Comments.',
        ));
      });
    } on Error {
      emit(state.copyWith(
        status: PageStateStatus.failedToUpdate,
        errorMessage: 'Failed to update Comments.',
      ));
    } on Exception {
      emit(state.copyWith(
        status: PageStateStatus.failedToUpdate,
        errorMessage: 'Failed to update Comments.',
      ));
    }
  }

  Future<void> addNewComment({
    required String taskId,
    required String content,
  }) async {
    try {
      Result<Comment> result =
          await commentsRepository.addComment(taskId: taskId, content: content);
      result.when(success: (Comment item) {
        final newCommentList = List<Comment>.from(state.comments!)..add(item);

        emit(state.copyWith(
            status: PageStateStatus.updated, comments: newCommentList));
      }, failure: (_) {
        emit(state.copyWith(
          status: PageStateStatus.failedToLoad,
          errorMessage: 'Failed to load Comments.',
        ));
      });
    } on Error {
      emit(state.copyWith(
        status: PageStateStatus.failedToLoad,
        errorMessage: 'Failed to load Comments.',
      ));
    } on Exception {
      emit(state.copyWith(
        status: PageStateStatus.failedToLoad,
        errorMessage: 'Failed to load Comments.',
      ));
    }
  }
}
