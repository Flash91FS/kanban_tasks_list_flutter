// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'due_date_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DueDateResponseModel _$DueDateResponseModelFromJson(
        Map<String, dynamic> json) =>
    DueDateResponseModel(
      date: json['date'] as String,
      string: json['string'] as String,
      lang: json['lang'] as String,
      isRecurring: json['is_recurring'] as bool,
    );

Map<String, dynamic> _$DueDateResponseModelToJson(
        DueDateResponseModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'string': instance.string,
      'lang': instance.lang,
      'is_recurring': instance.isRecurring,
    };
