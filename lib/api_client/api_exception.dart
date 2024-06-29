import 'package:kanban_tasks_list_flutter/api_client/json_models/error_response.dart';

class ApiException implements Exception {
  final int? code;
  final ErrorResponseModel? errorPayload;

  ApiException({required this.code, required this.errorPayload});

  @override
  String toString() {
    return 'ApiException $code: ${errorPayload.toString()}';
  }
}
