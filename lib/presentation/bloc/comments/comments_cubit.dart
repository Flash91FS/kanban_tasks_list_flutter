import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/domain/models/comment.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/comments/comments_state.dart';
import 'package:kanban_tasks_list_flutter/repository/i_comments_repository.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final ICommentsRepository commentsRepository;

  CommentsCubit({required this.commentsRepository})
      : super(const CommentsState.loading());

  Future<void> loadComments({required String taskId}) async {
    try {
      Result<List<Comment>> results = await commentsRepository.getComments(taskId: taskId);
      results.when(success: (List<Comment> items) {
        emit(CommentsState.loaded(
          allItems: items,
        ));
      }, failure: (_) {
        emit(const CommentsState.failedToLoad());
      });
    } on Error {
      emit(const CommentsState.failedToLoad());
    } on Exception {
      emit(const CommentsState.failedToLoad());
    }
  }
}
