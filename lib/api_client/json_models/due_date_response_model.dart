import 'package:json_annotation/json_annotation.dart';

part 'due_date_response_model.g.dart';

@JsonSerializable()
class DueDateResponseModel {
  // {
  // "date": "2024-06-28",
  // "string": "Jun 28",
  // "lang": "en",
  // "is_recurring": false
  // },

  final String date;
  final String string;
  final String lang;
  @JsonKey(name: 'is_recurring')
  final bool isRecurring;


  DueDateResponseModel({
    required String this.date,
    required String this.string,
    required String this.lang,
    required bool this.isRecurring,
  });

  factory DueDateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DueDateResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DueDateResponseModelToJson(this);
}
