import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponseModel {
  final String? detail;
  final Map<String, List<String>>? errors;
  final Object? extensions;
  final String? instance;
  final int status;
  final String? title;
  final String? type;

  const ErrorResponseModel(
      {this.detail,
      this.errors,
      this.extensions,
      this.instance,
      required this.status,
      this.title,
      this.type});

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseModelToJson(this);
}
