import 'dart:async';

import 'package:kanban_tasks_list_flutter/data/json_parsers/json_parser.dart';


enum ApiResponseAuthorizationStatus { unauthorized, authorized }

abstract class ApiClient {
  // String? get accessToken;
  //
  // set accessToken(String? token);
  //
  // Stream<String> get accessTokenUpdate;
  // Stream<ApiResponseAuthorizationStatus> get apiResponseAuthorizationStatusUpdate;
  Future<T> invokePost<T>(
      {required String path,
      required Object body,
      Map<String, String>? headerParams,
      String? contentType,
      bool isFormData,
      required JsonParser<T> parser});

  Future<T> invokePut<T>(
      {required String path,
      required Object body,
      Map<String, String>? headerParams,
      String? contentType,
      bool isFormData,
      required JsonParser<T> parser});

  Future<T> invokePatch<T>(
      {required String path,
      required Object body,
      Map<String, String>? headerParams,
      String? contentType,
      required JsonParser<T> parser});

  Future<T> invokeGet<T>({
    required String path,
    Map<String, String>? queryParams,
    Map<String, String>? headerParams,
    String? contentType,
    required JsonParser<T> parser,
  });

  Future<T> invokeGetFile<T>({
    required String path,
    Map<String, String>? queryParams,
    Map<String, String>? headerParams,
  });

  Future invokeDelete(
      {required String path, Map<String, String>? headerParams, String? contentType});

  // void dispose();
}
