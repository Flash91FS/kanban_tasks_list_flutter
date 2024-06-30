import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/bloc/kanban_board/kanban_board_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/bloc/kanban_board/kanban_board_state.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/config/kanban_config.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/widgets/kanban_task_item_view.dart';
import 'package:kanban_tasks_list_flutter/utils.dart';

class KanbanBoard extends StatefulWidget {
  const KanbanBoard({super.key});

  @override
  State<KanbanBoard> createState() => _KanbanBoardState();
}

class _KanbanBoardState extends State<KanbanBoard> {
  late AppFlowyBoardScrollController boardScrollController;
  late AppFlowyBoardController kanbanController;

  @override
  void initState() {
    boardScrollController = AppFlowyBoardScrollController();
    kanbanController = AppFlowyBoardController(
      onMoveGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
        logData(TAG_KANBAN_BOARD, 'onMoveGroup: Move item from $fromIndex to $toIndex');
      },
      onMoveGroupItem: (groupId, fromIndex, toIndex) {
        logData(TAG_KANBAN_BOARD, 'onMoveGroupItem: Move $groupId:$fromIndex to $groupId:$toIndex');
      },
      onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
        logData(TAG_KANBAN_BOARD, 'onMoveGroupItemToGroup: Move $fromGroupId:$fromIndex to $toGroupId:$toIndex');
        context.read<KanbanBoardCubit>().onMoveGroupItemToGroup(fromGroupId, fromIndex, toGroupId, toIndex);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    kanbanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KanbanBoardCubit, KanbanBoardState>(
      builder: (context, state) {
        kanbanController.addGroups(state.groups!);
        return LayoutBuilder(builder: (context, constraints)
        {
          return AppFlowyBoard(
            config: kanbanBoardConfig,
            controller: kanbanController,
            boardScrollController: boardScrollController,
            groupConstraints: BoxConstraints.tightFor(
              width: 240,
              height: MediaQuery
                  .sizeOf(context)
                  .height / 1.3,
            ),
            cardBuilder: (context, group, groupItem) {
              return AppFlowyGroupCard(
                decoration: const BoxDecoration(color: Colors.blue),
                key: ValueKey(groupItem.id),
                child: KanbanTaskItemView(
                  groupId: group.id,
                  item: groupItem,
                  controller: kanbanController,
                ),
              );
            },
            headerBuilder: (context, group) {
              return AppFlowyGroupHeader(
                title: Text(group.headerData.groupName),
                addIcon: group.id == 'Done'
                    ? null
                    : const Icon(Icons.add, size: 20),
                onAddButtonClick: () {
                  //todo add functionality for Add Button
                },
                height: 50,
                margin: kanbanBoardConfig.groupBodyPadding,
              );
            },
          );
        });
      }
    );
  }
}
