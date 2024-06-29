import 'package:kanban_tasks_list_flutter/core/models/common_error_messages.dart';

class DataLoadException implements Exception {
  DataLoadException({this.message});

  final String? message;

  @override
  String toString() {
    return message ?? CommonErrorMessages.GenericError;
  }
}
