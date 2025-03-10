import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'void_result.freezed.dart';

@freezed
class VoidResult with _$VoidResult {
  const factory VoidResult.success() = Success;

  const factory VoidResult.failure({required Exception error}) = Failure;
}
