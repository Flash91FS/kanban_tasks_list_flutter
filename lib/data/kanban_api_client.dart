import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kanban_tasks_list_flutter/data/api_client.dart';
import 'package:kanban_tasks_list_flutter/data/api_exception.dart';
import 'package:kanban_tasks_list_flutter/data/api_network_exception.dart';
import 'package:kanban_tasks_list_flutter/data/json_parsers/error_response_parser.dart';
import 'package:kanban_tasks_list_flutter/data/json_parsers/json_parser.dart';

class KanbanApiClient implements ApiClient {
  KanbanApiClient({
    required String basePath,
    required String apiToken,
    required Dio httpClient,
  })  : _basePath = basePath,
        _apiToken = apiToken,
        _httpClient = httpClient
  {
    _httpClient.options = _generateClientOptions(_basePath);
  }

  KanbanApiClient.withHttpDefaults(String basePath, String apiToken)
      : this(
          basePath: basePath,
          apiToken: apiToken,
          httpClient: Dio(),
        );

  final Dio _httpClient;
  final String _basePath;
  final String _apiToken;
  final timeOutInMilliseconds = 40000;

  @override
  Future<T> invokePost<T>(
      {required String path,
      required Object body,
      Map<String, String>? headerParams,
      String? contentType,
      bool isFormData = false,
      required JsonParser<T> parser}) {
    return _invoke(
        path: path,
        body: body,
        parser: parser,
        method: 'POST',
        isFormData: isFormData,
        headerParams: headerParams,
        contentType: contentType);
  }

  @override
  Future<T> invokePut<T>(
      {required String path,
      required Object body,
      Map<String, String>? headerParams,
      String? contentType,
      bool isFormData = false,
      required JsonParser<T> parser}) async {
    return _invoke(
        path: path,
        body: body,
        parser: parser,
        method: 'PUT',
        isFormData: isFormData,
        headerParams: headerParams,
        contentType: contentType);
  }

  @override
  Future<T> invokePatch<T>(
      {required String path,
      required Object body,
      Map<String, String>? headerParams,
      String? contentType,
      required JsonParser<T> parser}) async {
    return _invoke(
        path: path,
        body: body,
        parser: parser,
        method: 'PATCH',
        headerParams: headerParams,
        contentType: contentType);
  }

  @override
  Future<T> invokeGet<T>({
    required String path,
    Map<String, String>? queryParams,
    Map<String, String>? headerParams,
    String? contentType,
    required JsonParser<T> parser,
  }) async {
    return _invoke(
        path: path,
        parser: parser,
        method: 'GET',
        headerParams: headerParams,
        queryParams: queryParams,
        contentType: contentType);
  }

  @override
  Future<T> invokeGetFile<T>(
      {required String path,
      Map<String, String>? queryParams,
      Map<String, String>? headerParams}) async {
    return _invokeForFile(
        path: path,
        method: 'GET',
        headerParams: headerParams,
        queryParams: queryParams);
  }

  @override
  Future invokeDelete({
    required String path,
    Map<String, String>? headerParams,
    String? contentType,
  }) async {
    try {
      await _httpClient.request(path,
          options: Options(
              headers: headerParams,
              method: 'DELETE',
              contentType: contentType));
    } on DioError catch (ex) {
      throw mapToApiException(ex);
    }
  }

  dynamic mapToApiException(DioError ex) {
    if (ex.response != null) {
      return ApiException(
          code: ex.response?.statusCode,
          errorPayload: ex.response?.data == null || ex.response?.data.isEmpty
              ? null
              : const ErrorResponseModelParser()
                  .parseFromJson(ex.response?.data));
    } else {
      return ApiNetworkException(message: ex.message.toString());
    }
  }


  Future<T> _invoke<T>(
      {required String path,
      Object? body,
      Map<String, String>? headerParams,
      Map<String, String>? queryParams,
      String? contentType,
      bool isFormData = false,
      required JsonParser<T> parser,
      required String method}) async {
    try {
      final data = body != null
          ? isFormData
              ? body
              : jsonEncode(body)
          : null;
      final response = await _httpClient.request(path,
          options: Options(
            headers: headerParams,
            contentType: contentType ?? 'application/json',
            method: method,
          ),
          queryParameters: queryParams,
          data: data);

      return parser.parseFromJson(response.data);
    } on DioError catch (ex) {
      throw mapToApiException(ex);
    } on Error catch (error) {
      throw Exception('Failed parsing json data: $error');
    }
  }

  Future<T> _invokeForFile<T>(
      {required String path,
      Map<String, String>? headerParams,
      Map<String, String>? queryParams,
      required String method}) async {
    try {
      final response = await _httpClient.request(path,
          options: Options(
            responseType: ResponseType.bytes,
            headers: headerParams,
            method: method,
          ),
          queryParameters: queryParams);

      return response.data;
    } on DioError catch (ex) {
      throw mapToApiException(ex);
    } on Error catch (error) {
      throw Exception('Error: $error');
    }
  }


  BaseOptions _generateClientOptions(String basePath) {
    return BaseOptions(
        baseUrl: basePath,
        contentType: 'application/json',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiToken',
        },
        responseType: ResponseType.plain);
  }
}
