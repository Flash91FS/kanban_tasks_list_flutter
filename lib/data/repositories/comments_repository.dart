import 'package:kanban_tasks_list_flutter/data/apis/apis.dart';
import 'package:kanban_tasks_list_flutter/core/api_error_handler.dart';
import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/domain/irepositories/i_comments_repository.dart';
import 'package:kanban_tasks_list_flutter/domain/entities/comment.dart';

class CommentsRepository with ApiErrorHandler implements ICommentsRepository {
  final CommentsApi commentsApi;

  CommentsRepository({
    required this.commentsApi,
  });

  @override
  Future<Result<List<Comment>>> getComments({required String taskId}) {
    return captureApiErrorsAsResultFailure(() async {
      var commentsListResponse =
          await commentsApi.apiGetCommentsForTask(taskId);
      return Result.success(
          data: commentsListResponse
              .map(
                (model) => Comment(
                  id: model.id,
                  content: model.content,
                  postedAt: model.postedAt,
                  projectId: model.projectId,
                  taskId: model.taskId,
                  attachment: model.attachment,
                ),
              )
              .toList());
    });
  }

  @override
  Future<Result<Comment>> addComment(
      {required String taskId, required String content}) {
    return captureApiErrorsAsResultFailure(() async {
      var model = await commentsApi.apiPostAddComment(
          taskId: taskId, content: content);
      if (model != null) {
        return Result.success(
            data: Comment(
          id: model.id,
          content: model.content,
          postedAt: model.postedAt,
          projectId: model.projectId,
          taskId: model.taskId,
          attachment: model.attachment,
        ));
      } else {
        return Result.failure(error: Exception('Could not post comment'));
      }
    });
  }
}
