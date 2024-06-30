import 'package:kanban_tasks_list_flutter/api_client/api_client.dart';
import 'package:kanban_tasks_list_flutter/core/api_error_handler.dart';
import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/api_client/apis/apis.dart';
import 'package:kanban_tasks_list_flutter/domain/models/due_date.dart';
import 'package:kanban_tasks_list_flutter/domain/models/task.dart';
import 'i_tasks_repository.dart';

class TasksRepository with ApiErrorHandler implements ITasksRepository {

  final TasksApi _tasksApi;

  TasksRepository({
    required ApiClient apiClient,
  }) : _tasksApi = TasksApi(apiClient);

  @override
  Future<Result<List<Task>>> getTasksList() {
    return captureApiErrorsAsResultFailure(() async {
      var tasksListResponse = await _tasksApi.apiGetTasksList();
      return Result.success(
          data: tasksListResponse
              .map(
                (model) => Task(
                  id: model.id,
                  content: model.content,
                  description: model.description,
                  commentCount: model.commentCount,
                  isCompleted: model.isCompleted,
                  order: model.order,
                  priority: model.priority,
                  projectId: model.projectId,
                  labels: model.labels,
                  due: model.due != null
                      ? DueDate(
                          date: model.due!.date,
                          string: model.due!.string,
                          lang: model.due!.lang,
                          isRecurring: model.due!.isRecurring)
                      : null,
                  sectionId: model.sectionId,
                  parentId: model.parentId,
                  creatorId: model.creatorId,
                  createdAt: model.createdAt,
                  assigneeId: model.assigneeId,
                  assignerId: model.assignerId,
                  url: model.url,
                ),
              )
              .toList());
    });
  }

  @override
  Future<Result<String>> deleteTask({required String taskId}) {
    return captureApiErrorsAsResultFailure(() async {
      await _tasksApi.apiDeleteTask(taskId: taskId);
      return const Result.success(
          data: 'Task Deleted Successfully');
    });
  }
}
