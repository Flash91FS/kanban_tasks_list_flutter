import 'package:freezed_annotation/freezed_annotation.dart';

part 'section.freezed.dart';

@freezed
class Section with _$Section {
  factory Section({
    required String id,
    required String projectId,
    required String name,
    required int order,
  }) = _Section;
}
