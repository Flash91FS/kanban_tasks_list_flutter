import 'package:appflowy_board/appflowy_board.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kanban_item_data_model.freezed.dart';

@freezed
class KanbanItemDataModel extends AppFlowyGroupItem  with _$KanbanItemDataModel {
  // final String itemId;
  // final String groupId;
  // final String title;
  // final String description;
  // final DateTime? startDate;
  // final DateTime? endDate;
  // final DateTime? createdDate;
  // final DateTime? updatedDate;
  // final int? commentCount;

  factory KanbanItemDataModel({
    required String itemId,
    required String groupId,
    required String title,
    required String description,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? createdDate,
    DateTime? updatedDate,
    required int? commentCount,
  }) = _KanbanItemDataModel;

  KanbanItemDataModel._(); // Add the private constructor

  @override
  String get id => itemId;
}