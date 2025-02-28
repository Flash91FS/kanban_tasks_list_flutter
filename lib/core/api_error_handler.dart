import 'package:kanban_tasks_list_flutter/data/api_exception.dart';
import 'package:kanban_tasks_list_flutter/data/api_network_exception.dart';
import 'package:kanban_tasks_list_flutter/core/models/exceptions/data_load_exception.dart';
import 'package:kanban_tasks_list_flutter/core/models/exceptions/network_exception.dart';
import 'package:kanban_tasks_list_flutter/core/models/exceptions/unauthorized_exception.dart';
import 'package:kanban_tasks_list_flutter/core/models/exceptions/validation_exception.dart';
import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/core/models/void_result.dart';

typedef GetApiResult<T> = Future<Result<T>> Function();
typedef GetApiVoidResult = Future<VoidResult> Function();

mixin ApiErrorHandler {
  Future<Result<T>> captureApiErrorsAsResultFailure<T>(GetApiResult<T> apiCall) async {
    try {
      return await apiCall();
    } on ApiNetworkException catch (apiNetworkException) {
      return Result.failure(error: NetworkException(message: apiNetworkException.message));
    } on ApiException catch (apiEx) {
      return apiEx.code == 401
          ? Result.failure(error: UnauthorizedException(message: apiEx.errorPayload?.title))
          : apiEx.code == 400
              ? Result.failure(
                  error: ValidationException(
                  message: apiEx.errorPayload?.title,
                  errors: apiEx.errorPayload?.errors,
                ))
              : Result.failure(error: DataLoadException(message: apiEx.errorPayload?.title));
    } on Exception catch (ex) {
      return Result.failure(error: DataLoadException(message: ex.toString()));
    } on Error catch (err) {
      return Result.failure(error: DataLoadException(message: err.toString()));
    }
  }

  Future<VoidResult> captureApiErrorsAsVoidResultFailure(GetApiVoidResult apiCall) async {
    try {
      return await apiCall();
    } on ApiNetworkException catch (apiNetworkException) {
      return VoidResult.failure(error: NetworkException(message: apiNetworkException.message));
    } on ApiException catch (apiEx) {
      return apiEx.code == 401
          ? VoidResult.failure(error: UnauthorizedException(message: apiEx.errorPayload?.title))
          : VoidResult.failure(error: DataLoadException(message: apiEx.errorPayload?.title));
    } on Exception catch (ex) {
      return VoidResult.failure(error: DataLoadException(message: ex.toString()));
    } on Error catch (err) {
      return VoidResult.failure(error: DataLoadException(message: err.toString()));
    }
  }
}
