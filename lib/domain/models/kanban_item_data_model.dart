import 'package:appflowy_board/appflowy_board.dart';

class KanbanItemDataModel extends AppFlowyGroupItem {
  final String itemId;

  // final String groupId;
  final String title;
  final String description;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? createdDate;
  final DateTime? updatedDate;

  KanbanItemDataModel({
    required this.itemId,
    // required this.groupId,
    required this.title,
    required this.description,
    this.startDate,
    this.endDate,
    this.createdDate,
    this.updatedDate,
  });

  @override
  String get id => itemId;
}