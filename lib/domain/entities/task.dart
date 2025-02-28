import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_tasks_list_flutter/domain/entities/due_date.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  factory Task({
    required String id,
    required String content,
    required String description,
    required int commentCount,
    required bool isCompleted,
    required int order,
    required int priority,
    required String projectId,
    required List<String> labels,
    DueDate? due,
    String? sectionId,
    String? parentId,
    required String creatorId,
    required DateTime createdAt,
    String? assigneeId,
    String? assignerId,
    required String url,
  }) = _Task;
}
