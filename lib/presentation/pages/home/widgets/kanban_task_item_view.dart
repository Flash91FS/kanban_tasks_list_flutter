import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:kanban_tasks_list_flutter/domain/models/kanban_item_data_model.dart';
import 'package:kanban_tasks_list_flutter/extensions/nullable_date_formatting_extension.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/config/kanban_config.dart';

class KanbanTaskItemView extends StatelessWidget {
  final String groupId;
  final AppFlowyGroupItem item;
  final AppFlowyBoardController controller;

  const KanbanTaskItemView({
    super.key,
    required this.groupId,
    required this.item,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return kanbanCardItemView(context, item: item, controller: controller);
  }

  Widget kanbanCardItemView(
    BuildContext context, {
    required AppFlowyGroupItem item,
    required AppFlowyBoardController controller,
  }) {
    if (item is KanbanItemDataModel) {
      return DecoratedBox(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(fontSize: 14),
                      textAlign: TextAlign.left,
                    ),
                    if (item.description.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          item.description,
                          style: const TextStyle(
                              fontSize: 12,
                              color: kanbanCardSubtextColor),
                        ),
                      ),
                    if (item.startDate != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Row(
                          children: [
                            Text(
                              item.startDate.format('dd MMM' 'yy'),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: kanbanCardSubtextColor,
                              ),
                            ),
                            if (item.endDate != null)
                              Text(
                                '- ${item.endDate.format('dd MMM' 'yy')}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: kanbanCardSubtextColor,
                                ),
                              )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    throw UnimplementedError();
  }
}
