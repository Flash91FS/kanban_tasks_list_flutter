import 'package:freezed_annotation/freezed_annotation.dart';

part 'due_date.freezed.dart';

@freezed
class DueDate with _$DueDate {
  factory DueDate({
    required String date,
    required String string,
    required String lang,
    required bool isRecurring,
  }) = _DueDate;
}
