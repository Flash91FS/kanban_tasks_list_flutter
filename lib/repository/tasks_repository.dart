import 'package:kanban_tasks_list_flutter/api_client/api_client.dart';
import 'package:kanban_tasks_list_flutter/api_client/json_models/task_post_model.dart';
import 'package:kanban_tasks_list_flutter/api_client/json_models/task_update_model.dart';
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
  Future<Result<Task>> addNewTask({
    required String projectId,
    required String sectionId,
    required String title,
    required String description,
  }) {
    return captureApiErrorsAsResultFailure(() async {
      var model = await _tasksApi.apiPostAddTask(
        TaskPostModel(
          projectId: projectId,
          sectionId: sectionId,
          content: title,
          description: description,
          // dueString: task.due?.string,
          // dueDate: task.due?.date,
          // dueDatetime: , //convert task.due?.date to DateTime object and use it's string value
          // dueLang: 'en',
        ),
      );
      return Result.success(
        data: Task(
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
      );
    });
  }

  @override
  Future<Result<Task>> updateTask({
    required String taskId,
    required String title,
    required String description,
  }) {
    return captureApiErrorsAsResultFailure(() async {
      var model = await _tasksApi.apiPostUpdateTask(
        taskId: taskId,
        taskPost: TaskUpdateModel(
          content: title,
          description: description,
        ),
      );
      return Result.success(
        data: Task(
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
      );
    });
  }

  @override
  Future<Result<String>> deleteTask({required String taskId}) {
    return captureApiErrorsAsResultFailure(() async {
      await _tasksApi.apiDeleteTask(taskId: taskId);
      return const Result.success(data: 'Task Deleted Successfully');
    });
  }

  @override
  Future<Result<String>> loadSyncState() {
    return captureApiErrorsAsResultFailure(() async {
      var syncResponse = await _tasksApi.apiPostSyncState();
      if (syncResponse != null) {
        return Result.success(data: syncResponse.syncToken);
      } else {
        return Result.failure(error: Exception('Could not load project sync state'));
      }
    });
  }

  @override
  Future<Result<String>> moveTaskToSection({
    required String syncToken,
    required String uuid,
    required String taskId,
    required String toSectionId,
  }) {
    return captureApiErrorsAsResultFailure(() async {
      var syncResponse = await _tasksApi.apiPostSyncItemMove(syncToken: syncToken, uuid: uuid, taskId: taskId, toSectionId: toSectionId);
      if (syncResponse != null) {
        return Result.success(data: syncResponse.syncToken);
      } else {
        return Result.failure(error: Exception('Could not load project sync state'));
      }
    });
  }
}
