import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/domain/models/kanban_item_data_model.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/environment/environment_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/tasks/tasks_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/dimensions.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/bloc/kanban_board/kanban_board_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/bloc/kanban_board/kanban_board_state.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/config/kanban_config.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/widgets/kanban_task_details_view.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/widgets/kanban_task_item_view.dart';
import 'package:kanban_tasks_list_flutter/presentation/responsive_dialog.dart';
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
        logData(TAG_KANBAN_BOARD,
            'onMoveGroup: Move item from $fromIndex to $toIndex');
      },
      onMoveGroupItem: (groupId, fromIndex, toIndex) {
        logData(TAG_KANBAN_BOARD,
            'onMoveGroupItem: Move $groupId:$fromIndex to $groupId:$toIndex');
      },
      onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
        logData(TAG_KANBAN_BOARD,
            'onMoveGroupItemToGroup: Move $fromGroupId:$fromIndex to $toGroupId:$toIndex');
        context
            .read<KanbanBoardCubit>()
            .onMoveGroupItemToGroup(fromGroupId, fromIndex, toGroupId, toIndex);
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
    final envState = BlocProvider.of<EnvironmentCubit>(context).state;
    final sectionIdDone = envState.sectionIdDone;
    final projectId = envState.projectId;

    return BlocBuilder<KanbanBoardCubit, KanbanBoardState>(
        builder: (context, state) {
      //Todo - delete the below line used to just log data on console
      state.groups!.forEach((group) {
        logData(TAG_KANBAN_BOARD, 'BlocBuilder - group : ${group.id}');
        group.items.forEach((current) {
          if (current is KanbanItemDataModel)
            logData(TAG_KANBAN_BOARD,
                'BlocBuilder - groupItem : ${current.itemId} -  ${current.title} - ${current.description}');
        });
        // groupItemsInProgress.forEach((current) {
        //   logData(TAG_KANBAN_BOARD_CUBIT,
        //       'GroupItems-InProgress - current : ${current.itemId} -  ${current.title} - ${current.description}');
        // });
        // groupItemsDone.forEach((current) {
        //   logData(TAG_KANBAN_BOARD_CUBIT,
        //       'GroupItems-Done - current : ${current.itemId} -  ${current.title} - ${current.description}');
        // });
      });

      kanbanController.clear();
      kanbanController.addGroups(state.groups!);

      return Padding(
        padding: const EdgeInsets.all(14.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: AppFlowyBoard(
            config: kanbanBoardConfig,
            controller: kanbanController,
            boardScrollController: boardScrollController,
            groupConstraints: BoxConstraints.tightFor(
              width: (Dimensions.isMobile(context)) ? 240 : 320,
              height: MediaQuery.sizeOf(context).height / 1.3,
            ),
            cardBuilder: (context, group, groupItem) {
              return AppFlowyGroupCard(
                decoration: const BoxDecoration(
                  color: kanbanTaskItemColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                key: ValueKey(groupItem.id),
                child: KanbanTaskItemView(
                  projectId: projectId,
                  groupId: group.id,
                  item: groupItem,
                  controller: kanbanController,
                ),
              );
            },
            headerBuilder: (context, group) {
              return Column(
                children: [
                  AppFlowyGroupHeader(
                    title: Text(
                        '${group.headerData.groupName} - ${group.headerData.groupId}'),
                    addIcon: group.id == sectionIdDone
                        ? null
                        : const Icon(Icons.add, size: 20),
                    onAddButtonClick: () async {
                      if (group.id != sectionIdDone) {
                        await ResponsiveDialog.showResponsiveDialog(
                          context,
                          KanbanTaskDetailsView(
                              isAdd: true,
                              data: null,
                              onTapCallBack: (value) {
                                logData(TAG_KANBAN_BOARD,
                                    'value: projectId: $projectId');
                                logData(TAG_KANBAN_BOARD,
                                    'value: groupId: ${group.headerData.groupId}');
                                logData(TAG_KANBAN_BOARD,
                                    'value: title: ${value.title}');
                                logData(TAG_KANBAN_BOARD,
                                    'value: description: ${value.description}');
                                context.read<TasksCubit>().addNewTask(
                                    projectId: projectId,
                                    sectionId: group.headerData.groupId,
                                    title: value.title,
                                    description: value.description);
                              }),
                          needsMaterialWrapper: true,
                          fullScreen: true,
                        );
                      }
                    },
                    height: 50,
                    margin: kanbanBoardConfig.groupBodyPadding,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(8,0,8,8),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.blue,
                    ),
                  )
                ],
              );
            },
          ),
        ),
      );
      // });
    });
  }
}
