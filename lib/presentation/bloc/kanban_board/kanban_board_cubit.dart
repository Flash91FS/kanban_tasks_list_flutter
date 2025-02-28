import 'dart:async';

import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/core/page_state_status.dart';
import 'package:kanban_tasks_list_flutter/domain/entities/kanban_item_data_model.dart';
import 'package:kanban_tasks_list_flutter/domain/entities/task.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/environment/environment_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/tasks/tasks_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/tasks/tasks_state.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/kanban_board/kanban_board_state.dart';
import 'package:kanban_tasks_list_flutter/domain/irepositories/i_firebase_repository.dart';
import 'package:kanban_tasks_list_flutter/utils.dart';


class KanbanBoardCubit extends Cubit<KanbanBoardState> {
  KanbanBoardCubit({
    required this.tasksCubit,
    required this.firebaseRepository,
    required this.environmentCubit,
  }) : super(const KanbanBoardState(groups: [])) {
    _tasksSubscription = tasksCubit.stream.listen(_handleTasksStateChange);
    _handleTasksStateChange(tasksCubit.state);
  }

  final TasksCubit tasksCubit;
  final IFirebaseRepository firebaseRepository;
  final EnvironmentCubit environmentCubit;
  late StreamSubscription<TasksState> _tasksSubscription;

  @override
  Future<void> close() {
    _tasksSubscription.cancel();
    return super.close();
  }

  _handleTasksStateChange(TasksState tasksState) {
    if (tasksState.status == PageStateStatus.loaded ||
        tasksState.status == PageStateStatus.updated) {
      final newGroups = createGroups(tasksState.tasks);
      logData(
          TAG_KANBAN_BOARD_CUBIT, '_handleTasksStateChange(): CUBIT STATE -- BEFORE: $state');

      logData(
          TAG_KANBAN_BOARD_CUBIT, '_handleTasksStateChange(): tasksState : $tasksState');
      // if (newGroups != state.groups) {
        //Only update when the groups change.
        logData(
            TAG_KANBAN_BOARD_CUBIT, '_handleTasksStateChange(): newGroups != state.groups');
        logData(
            TAG_KANBAN_BOARD_CUBIT, '_handleTasksStateChange(): newGroups : $newGroups');
        emit(state.copyWith(groups: newGroups));
      logData(
          TAG_KANBAN_BOARD_CUBIT, '_handleTasksStateChange(): CUBIT STATE -- AFTER: $state');
      // } else {
      //   logData(
      //       TAG_KANBAN_BOARD_CUBIT, 'moveTaskToSection(): newGroups == state.groups');
      // }
    }
  }

  List<AppFlowyGroupData> createGroups(List<Task>? tasks) {
    List<KanbanItemDataModel> groupItemsTodo = [];
    List<KanbanItemDataModel> groupItemsInProgress = [];
    List<KanbanItemDataModel> groupItemsDone = [];
    logData(
        TAG_KANBAN_BOARD_CUBIT, ' createGroups():');
    logData(
        TAG_KANBAN_BOARD_CUBIT, ' createGroups(): tasks = ${tasks}');
    logData(
        TAG_KANBAN_BOARD_CUBIT,
        ' createGroups(): ${environmentCubit.state.sectionIdToDo}');

    if (tasks != null) {
      for (Task item in tasks) {
        logData(
            TAG_KANBAN_BOARD_CUBIT,
            'createGroups(): item.sectionId : ${item.sectionId}');
        if (item.sectionId == environmentCubit.state.sectionIdToDo) {
          groupItemsTodo.add(KanbanItemDataModel(
            groupId: item.sectionId!,
            itemId: item.id,
            title: item.content,
            description: item.description,
            startDate: item.createdAt,
            commentCount: item.commentCount,
          ));
        } else if (item.sectionId ==
            environmentCubit.state.sectionIdInProgress) {
          groupItemsInProgress.add(KanbanItemDataModel(
            groupId: item.sectionId!,
            itemId: item.id,
            title: item.content,
            description: item.description,
            startDate: item.createdAt,
            commentCount: item.commentCount,
          ));
        } else if (item.sectionId == environmentCubit.state.sectionIdDone) {
          groupItemsDone.add(KanbanItemDataModel(
            groupId: item.sectionId!,
            itemId: item.id,
            title: item.content,
            description: item.description,
            startDate: item.createdAt,
            commentCount: item.commentCount,
          ));
        }
      }
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


    logData(TAG_KANBAN_BOARD_CUBIT,
        'createGroups(): group1.items = ${group1.items}');
    // for (AppFlowyGroupItem item in group1.items) {
    //   item.id
    // }

    return [group1, group2, group3];
  }

  Future<void> onMoveGroupItemToGroup(String fromGroupId, int fromIndex,
      String toGroupId, int toIndex) async {
    logData(TAG_KANBAN_BOARD_CUBIT,
        'onMoveGroupItemToGroup(): fromGroupId = $fromGroupId');
    logData(
        TAG_KANBAN_BOARD_CUBIT, 'onMoveGroupItemToGroup(): fromIndex = $fromIndex');
    logData(
        TAG_KANBAN_BOARD_CUBIT, 'onMoveGroupItemToGroup(): toGroupId = $toGroupId');
    logData(TAG_KANBAN_BOARD_CUBIT, 'onMoveGroupItemToGroup(): toIndex = $toIndex');
    try {
      if (state.groups != null && tasksCubit.state.tasks != null) {

        AppFlowyGroupData fromGroup =
        state.groups!.firstWhere((group) => group.id == fromGroupId);
        final fromItems = fromGroup.items;
        logData(TAG_KANBAN_BOARD_CUBIT, 'onMoveGroupItemToGroup(): fromGroup.items = ${fromGroup.items}');
        for(AppFlowyGroupItem i in fromItems){
          logData(TAG_KANBAN_BOARD_CUBIT, 'onMoveGroupItemToGroup(): i.id = ${i.id}');
        }

        AppFlowyGroupData toGroup =
        state.groups!.firstWhere((group) => group.id == toGroupId);
        final toItems = toGroup.items;
        logData(TAG_KANBAN_BOARD_CUBIT, 'onMoveGroupItemToGroup(): toGroup.items = ${toGroup.items}');
        for(AppFlowyGroupItem i in toItems){
          logData(TAG_KANBAN_BOARD_CUBIT, 'onMoveGroupItemToGroup(): i.id = ${i.id}');
        }
        AppFlowyGroupItem item = toGroup.items.elementAt(toIndex);
        logData(TAG_KANBAN_BOARD_CUBIT, 'onMoveGroupItemToGroup(): toGroup = $toGroup');

        final task =
        tasksCubit.state.tasks!.firstWhere((task) => task.id == item.id);

        logData(TAG_KANBAN_BOARD_CUBIT,
            'onMoveGroupItemToGroup(): calling moveTaskToSection');
        tasksCubit.moveTaskToSection(taskId: task.id, toSectionId: toGroup.id);

        if (fromGroupId == environmentCubit.state.sectionIdInProgress) {
          await firebaseRepository.stopTimeTrackingWithoutDetails(
              taskId: task.id);
        }
      }
    } catch (ex) {
      logData(
          TAG_KANBAN_BOARD_CUBIT, 'onMoveGroupItemToGroup(): Exception = ${ex.toString()}');
      emit(state.copyWith(groups: state.groups)); //Re emit the current state.
    }
  }
}
