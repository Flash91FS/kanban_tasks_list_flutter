import 'package:json_annotation/json_annotation.dart';

part 'task_update_model.g.dart';

@JsonSerializable()
class TaskUpdateModel {

  final String content;
  final String? description;

  TaskUpdateModel({
    required this.content,
    this.description,
  });

  factory TaskUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$TaskUpdateModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskUpdateModelToJson(this);
}
