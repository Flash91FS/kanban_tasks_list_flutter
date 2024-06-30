import 'dart:async';

import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/core/page_state_status.dart';
import 'package:kanban_tasks_list_flutter/domain/models/kanban_item_data_model.dart';
import 'package:kanban_tasks_list_flutter/domain/models/task.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/environment/environment_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/tasks/tasks_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/tasks/tasks_state.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/bloc/kanban_board/kanban_board_state.dart';
import 'package:kanban_tasks_list_flutter/utils.dart';

class KanbanBoardCubit extends Cubit<KanbanBoardState> {
  KanbanBoardCubit({
    required this.tasksCubit,
    required this.environmentCubit,
  }) : super(const KanbanBoardState(groups: [])) {
    _tasksSubscription =
        tasksCubit.stream.listen(_handleBalanceBillStateChange);
    _handleBalanceBillStateChange(tasksCubit.state);
  }

  final TasksCubit tasksCubit;
  final EnvironmentCubit environmentCubit;
  late StreamSubscription<TasksState> _tasksSubscription;

  @override
  Future<void> close() {
    _tasksSubscription.cancel();
    return super.close();
  }

  _handleBalanceBillStateChange(TasksState tasksState) {
    logData(TAG_KANBAN_BOARD_CUBIT, '_handleBalanceBillStateChange(): ');
    logData(TAG_KANBAN_BOARD_CUBIT, '_handleBalanceBillStateChange(): tasksState.status = ${tasksState.status}');
    if (tasksState.status == PageStateStatus.loaded ||
        tasksState.status == PageStateStatus.updated) {

      emit(state.copyWith(groups: createGroups(tasksState.tasks)));
    }
  }

  List<AppFlowyGroupData> createGroups(List<Task>? tasks) {
    logData(TAG_KANBAN_BOARD_CUBIT, 'createGroups():');

    List<KanbanItemDataModel> groupItemsTodo = [];
    List<KanbanItemDataModel> groupItemsInProgress = [];
    List<KanbanItemDataModel> groupItemsDone = [];

    if (tasks != null) {
      for (Task item in tasks) {
        if (item.sectionId == environmentCubit.state.sectionIdToDo) {
          groupItemsTodo.add(KanbanItemDataModel(
            itemId: item.id,
            title: item.content,
            description: item.description,
            startDate: item.createdAt,
          ));
        } else if (item.sectionId == environmentCubit.state.sectionIdInProgress) {
          groupItemsInProgress.add(KanbanItemDataModel(
            itemId: item.id,
            title: item.content,
            description: item.description,
            startDate: item.createdAt,
          ));
        } else if (item.sectionId == environmentCubit.state.sectionIdDone) {
          groupItemsDone.add(KanbanItemDataModel(
            itemId: item.id,
            title: item.content,
            description: item.description,
            startDate: item.createdAt,
          ));
        }
      }

      //Todo - delete the below line used to just log data on console
      groupItemsTodo.forEach((current) {
        logData(TAG_KANBAN_BOARD_CUBIT,
            'GroupItems-Todo - current : ${current.itemId} -  ${current.title} - ${current.description}');
      });
      groupItemsInProgress.forEach((current) {
        logData(TAG_KANBAN_BOARD_CUBIT,
            'GroupItems-InProgress - current : ${current.itemId} -  ${current.title} - ${current.description}');
      });
      groupItemsDone.forEach((current) {
        logData(TAG_KANBAN_BOARD_CUBIT,
            'GroupItems-Done - current : ${current.itemId} -  ${current.title} - ${current.description}');
      });
    }


    final group1 = AppFlowyGroupData(
      id: environmentCubit.state.sectionIdToDo,
      name: 'To Do',
      items: List<AppFlowyGroupItem>.from(groupItemsTodo),
    );
    final group2 = AppFlowyGroupData(
      id: environmentCubit.state.sectionIdInProgress,
      name: 'In Progress',
      items: List<AppFlowyGroupItem>.from(groupItemsInProgress),
    );
    final group3 = AppFlowyGroupData(
      id: environmentCubit.state.sectionIdDone,
      name: 'Done',
      items: List<AppFlowyGroupItem>.from(groupItemsDone),
    );

    return [group1, group2, group3];
  }

  Future<void> onMoveGroupItemToGroup(
      String fromGroupId, int fromIndex, String toGroupId, int toIndex) async {
    if (state.groups != null) {
      AppFlowyGroupData group =
          state.groups!.firstWhere((group) => group.id == fromGroupId);
      if (group.items.length > fromIndex) {
        AppFlowyGroupItem item = group.items.elementAt(fromIndex);
        logData(
            TAG_KANBAN_BOARD_CUBIT, 'onMoveGroupItemToGroup(): From group: ${group.id}');
        logData(TAG_KANBAN_BOARD_CUBIT, 'onMoveGroupItemToGroup(): Item: ${item.id}');
      } else {
        logData(TAG_KANBAN_BOARD_CUBIT,
            'onMoveGroupItemToGroup(): group items length: ${group.items.length}');
        logData(TAG_KANBAN_BOARD_CUBIT, 'onMoveGroupItemToGroup(): index: $fromIndex');
      }

      AppFlowyGroupData toGroup =
          state.groups!.firstWhere((group) => group.id == toGroupId);
      // if(toGroup.items.length>toIndex) {
      AppFlowyGroupItem item = toGroup.items.elementAt(toIndex);
      logData(TAG_KANBAN_BOARD_CUBIT,
          'onMoveGroupItemToGroup(): From toGroup: ${toGroup.id}');
      logData(TAG_KANBAN_BOARD_CUBIT, 'onMoveGroupItemToGroup(): Item: ${item.id}');
      // }else{
      //   logData(TAG_KANBAN_BOARD_CUBIT, 'onMoveGroupItemToGroup(): toGroup items length: ${toGroup.items.length}');
      //   logData(TAG_KANBAN_BOARD_CUBIT, 'onMoveGroupItemToGroup(): index: ${toIndex}');
      // }


      final task = tasksCubit.state.tasks!.firstWhere((task) => task.id == item.id);
      logData(TAG_KANBAN_BOARD_CUBIT,
          'onMoveGroupItemToGroup(): task : ${task.id} -  ${task.sectionId} - ${task.content} - ${task.description}');

      //TODO call api to move task to group with id "toGroupId"
    }
  }
}
