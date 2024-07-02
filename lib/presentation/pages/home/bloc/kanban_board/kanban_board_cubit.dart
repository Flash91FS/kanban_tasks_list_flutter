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
import 'package:kanban_tasks_list_flutter/repository/i_firebase_repository.dart';

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
      emit(state.copyWith(groups: createGroups(tasksState.tasks)));
    }
  }

  List<AppFlowyGroupData> createGroups(List<Task>? tasks) {
    List<KanbanItemDataModel> groupItemsTodo = [];
    List<KanbanItemDataModel> groupItemsInProgress = [];
    List<KanbanItemDataModel> groupItemsDone = [];

    if (tasks != null) {
      for (Task item in tasks) {
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

    return [group1, group2, group3];
  }

  Future<void> onMoveGroupItemToGroup(
      String fromGroupId, int fromIndex, String toGroupId, int toIndex) async {
    if (state.groups != null) {
      AppFlowyGroupData toGroup =
          state.groups!.firstWhere((group) => group.id == toGroupId);
      AppFlowyGroupItem item = toGroup.items.elementAt(toIndex);

      final task =
          tasksCubit.state.tasks!.firstWhere((task) => task.id == item.id);

      tasksCubit.moveTaskToSection(taskId: task.id, toSectionId: toGroup.id);

      if (fromGroupId == environmentCubit.state.sectionIdInProgress) {
        await firebaseRepository.stopTimeTrackingWithoutDetails(taskId: task.id);
      }
    }
  }
}
