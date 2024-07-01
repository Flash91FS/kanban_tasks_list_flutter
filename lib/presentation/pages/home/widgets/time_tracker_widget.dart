import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/core/page_state_status.dart';
import 'package:kanban_tasks_list_flutter/domain/models/kanban_item_data_model.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/environment/environment_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/bloc/kanban_task/kanban_task_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/bloc/kanban_task/kanban_task_state.dart';
import 'package:kanban_tasks_list_flutter/presentation/widgets/row_spacer/row_spacer.dart';

class TimeTrackerWidget extends StatelessWidget {
  final KanbanItemDataModel taskItem;

  const TimeTrackerWidget({
    super.key,
    required this.taskItem,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<KanbanTaskCubit>(
      create: (context) => KanbanTaskCubit()..loadData(taskItem.itemId),
      child: BlocBuilder<KanbanTaskCubit, KanbanTaskState>(
        builder: (context, state) {
          return Column(
            children: [
              if (state.status == PageStateStatus.loaded ||
                  state.status == PageStateStatus.updated)
                Text('Total Time Spent: ${state.timeDurationToDisplay}')
              else
                const Text('Total Time Spent: 0s'),
              const RowSpacer(),
              if ((taskItem.groupId ==
                      BlocProvider.of<EnvironmentCubit>(context)
                          .state
                          .sectionIdInProgress) &&
                  (state.status == PageStateStatus.loaded ||
                      state.status == PageStateStatus.updated)) ...[
                const RowSpacer(),
                Text(
                    state.timeTrackingStarted
                        ? 'Click the button below to STOP Time-Tracking for this task'
                        : 'Click the button below to START Time-Tracking for this task',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const RowSpacer(),
                ElevatedButton(
                  onPressed: () {
                    if (!state.timeTrackingStarted) {
                      context
                          .read<KanbanTaskCubit>()
                          .startTimeTracking(taskId: taskItem.itemId);
                    } else {
                      context
                          .read<KanbanTaskCubit>()
                          .stopTimeTracking(taskId: taskItem.itemId);
                    }
                  },
                  child: Text(state.timeTrackingStarted
                      ? 'Stop Time Tracking'
                      : 'Start Time Tracking'),
                ),
              ]
            ],
          );
        },
      ),
    );
  }
}
