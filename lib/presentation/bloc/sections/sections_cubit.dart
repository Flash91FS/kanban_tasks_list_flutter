import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/domain/entities/section.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/sections/sections_state.dart';
import 'package:kanban_tasks_list_flutter/domain/irepositories/i_sections_repository.dart';

class SectionsCubit extends Cubit<SectionsState> {
  final ISectionsRepository sectionsRepository;

  SectionsCubit({required this.sectionsRepository})
      : super(const SectionsState.loading());

  Future<void> loadResults() async {
    try {
      Result<List<Section>> results = await sectionsRepository.getSectionsList();
      results.when(success: (List<Section> items) {
        emit(SectionsState.loaded(allItems: items));
      }, failure: (_) {
        emit(const SectionsState.failedToLoad());
      });
    } on Error {
      emit(const SectionsState.failedToLoad());
    } on Exception {
      emit(const SectionsState.failedToLoad());
    }
  }
}
