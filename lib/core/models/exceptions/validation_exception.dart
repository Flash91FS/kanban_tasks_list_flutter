import 'package:kanban_tasks_list_flutter/core/models/common_error_messages.dart';

class ValidationException implements Exception {
  ValidationException({this.message, this.errors});

  final String? message;
  final Map<String, List<String>>? errors;

  @override
  String toString() {
    return message ?? CommonErrorMessages.GenericError;
  }
}
