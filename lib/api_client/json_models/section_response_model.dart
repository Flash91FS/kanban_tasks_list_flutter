import 'package:json_annotation/json_annotation.dart';

part 'section_response_model.g.dart';

@JsonSerializable()
class SectionResponseModel {

  final String id;
  @JsonKey(name: 'project_id')
  final String projectId;
  final int order;
  final String name;


  SectionResponseModel({

    required String this.id,
    required String this.projectId,
    required String this.name,
    required int this.order,

  });

  factory SectionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SectionResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SectionResponseModelToJson(this);
}
