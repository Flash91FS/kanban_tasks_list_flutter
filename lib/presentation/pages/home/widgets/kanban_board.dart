import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/environment/environment_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/tasks/tasks_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/dimensions.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/kanban_board/kanban_board_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/kanban_board/kanban_board_state.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/config/kanban_config.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/widgets/kanban_task_details_view.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/widgets/kanban_task_item_view.dart';
import 'package:kanban_tasks_list_flutter/presentation/responsive_dialog.dart';

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
        //add logic for onMoveGroup
      },
      onMoveGroupItem: (groupId, fromIndex, toIndex) {
        //add logic for onMoveGroupItem
      },
      onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
        //add logic for onMoveGroupItemToGroup
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
      kanbanController.clear();
      kanbanController.addGroups(state.groups!);

      return Padding(
        padding: const EdgeInsets.all(14.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: AppFlowyBoard(
            key: const Key('Key-AppFlowyBoard'),
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
                  key: Key('Key-KanbanTaskItemView-${groupItem.id}'),
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
                      key: Key('Key-GroupName-${group.id}'),
                        group.headerData.groupName,),
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
                              sectionId: group.id,
                              onTapCallBack: (value) {
                                context.read<TasksCubit>().addNewTask(
                                    projectId: projectId,
                                    sectionId: group.headerData.groupId,
                                    title: value.title,
                                    description: value.description);
                              },
                          ),
                          needsMaterialWrapper: true,
                          fullScreen: true,
                        );
                      }
                    },
                    height: 50,
                    margin: kanbanBoardConfig.groupBodyPadding,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
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
