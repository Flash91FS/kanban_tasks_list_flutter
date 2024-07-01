import 'package:flutter/foundation.dart';

const String TAG_UTILS = "FS - Utils - ";
const String TAG_K_API_CLIENT = "FS - K_ApiClient - ";
const String TAG_RESPONSE = "FS - Response - ";
const String TAG_HOME_PAGE = "FS - HomePage - ";
const String TAG_KANBAN_BOARD = "FS - KanbanBoard - ";
const String TAG_KANBAN_BOARD_CUBIT = "FS - KanbanBoardCubit - ";
const String TAG_TASKS_CUBIT = "FS - TasksCubit - ";
const String TAG_COMMENTS_CUBIT = "FS - CommentsCubit - ";
const String TAG_PROJECTS_CUBIT = "FS - ProjectsCubit - ";
const String TAG_SECTIONS_CUBIT = "FS - SectionsCubit - ";
const String TAG_KANBAN_TASK_CUBIT = "FS - KanbanTaskCubit - ";

void logData(String tag, String data) {
  //TODO add restriction to log only for debug version
  debugPrint('$tag $data');
}