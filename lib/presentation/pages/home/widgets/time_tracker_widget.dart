import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/core/page_state_status.dart';
import 'package:kanban_tasks_list_flutter/domain/entities/kanban_item_data_model.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/environment/environment_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/time_tracker/time_tracker_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/time_tracker/time_tracker_state.dart';
import 'package:kanban_tasks_list_flutter/presentation/util_widgets/row_spacer.dart';
import 'package:kanban_tasks_list_flutter/domain/irepositories/i_firebase_repository.dart';

class TimeTrackerWidget extends StatelessWidget {
  final KanbanItemDataModel taskItem;

  const TimeTrackerWidget({
    super.key,
    required this.taskItem,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimeTrackerCubit>(
      create: (context) => TimeTrackerCubit(
        firebaseRepository: RepositoryProvider.of<IFirebaseRepository>(context),
      )..loadData(taskItem.itemId),
      child: BlocBuilder<TimeTrackerCubit, TimeTrackerState>(
        builder: (context, state) {
          return Column(
            children: [
              if (state.status == PageStateStatus.loaded ||
                  state.status == PageStateStatus.updated)
                Text('Total Time Spent: ${state.timeDurationToDisplay}')
              else
                const Text('Total Time Spent: 0s'),
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
                          .read<TimeTrackerCubit>()
                          .startTimeTracking(taskId: taskItem.itemId);
                    } else {
                      context
                          .read<TimeTrackerCubit>()
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
