import 'package:appflowy_board/appflowy_board.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kanban_board_state.freezed.dart';

@freezed
class KanbanBoardState with _$KanbanBoardState {
  const factory KanbanBoardState({
    List<AppFlowyGroupData>? groups,
  }) = _KanbanBoardState;
}
