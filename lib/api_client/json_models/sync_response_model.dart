import 'package:json_annotation/json_annotation.dart';

part 'sync_response_model.g.dart';

@JsonSerializable()
class SyncResponseModel {
  @JsonKey(name: 'full_sync')
  final bool fullSync;
  @JsonKey(name: 'sync_token')
  final String syncToken;
  // final List<dynamic> projects;


  SyncResponseModel({
    required this.fullSync,
    required this.syncToken,
    // required this.projects,
  });

  factory SyncResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SyncResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SyncResponseModelToJson(this);
}
