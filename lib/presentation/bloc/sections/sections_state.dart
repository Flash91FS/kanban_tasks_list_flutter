import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_tasks_list_flutter/domain/models/section.dart';

part 'sections_state.freezed.dart';

@freezed
class SectionsState with _$SectionsState {
  const factory SectionsState.loaded({
    required List<Section> allItems,
  }) = Data;

  const factory SectionsState.loading() = Loading;

  const factory SectionsState.failedToLoad() = FailedToLoad;
}
