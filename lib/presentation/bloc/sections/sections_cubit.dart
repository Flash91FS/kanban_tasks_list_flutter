import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/domain/models/section.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/sections/sections_state.dart';
import 'package:kanban_tasks_list_flutter/repository/i_sections_repository.dart';
import 'package:kanban_tasks_list_flutter/utils.dart';

class SectionsCubit extends Cubit<SectionsState> {
  final ISectionsRepository sectionsRepository;

  SectionsCubit({required this.sectionsRepository})
      : super(const SectionsState.loading());

  Future<void> loadResults() async {
    logData(TAG_SECTIONS_CUBIT, 'loadResults():');

    try {
      Result<List<Section>> results = await sectionsRepository.getSectionsList();
      logData(TAG_SECTIONS_CUBIT, 'results = $results');
      results.when(success: (List<Section> items) {
        logData(TAG_SECTIONS_CUBIT, 'items = $items');
        emit(SectionsState.loaded(
          allItems: items,
        ));
      }, failure: (_) {
        logData(TAG_SECTIONS_CUBIT, 'failure:');
        emit(const SectionsState.failedToLoad());
      });
    } on Error {
      logData(TAG_SECTIONS_CUBIT, 'Error:');
      emit(const SectionsState.failedToLoad());
    } on Exception {
      logData(TAG_SECTIONS_CUBIT, 'Exception:');
      emit(const SectionsState.failedToLoad());
    }
  }
}
