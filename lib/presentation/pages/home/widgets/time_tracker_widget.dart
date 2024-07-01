import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/core/page_state_status.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/bloc/kanban_task/kanban_task_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/bloc/kanban_task/kanban_task_state.dart';
import 'package:kanban_tasks_list_flutter/presentation/widgets/row_spacer/row_spacer.dart';

class TimeTrackerWidget extends StatelessWidget {
  final String itemId;

  const TimeTrackerWidget({
    super.key,
    required this.itemId,
  });

  String prettyDuration(Duration duration) {
    var components = <String>[];

    var days = duration.inDays;
    if (days != 0) {
      components.add('${days}d ');
    }
    var hours = duration.inHours % 24;
    if (hours != 0) {
      components.add('${hours}h ');
    }
    var minutes = duration.inMinutes % 60;
    if (minutes != 0) {
      components.add('${minutes}m ');
    }

    var seconds = duration.inSeconds % 60;
    var centiseconds = (duration.inMilliseconds % 1000) ~/ 10;
    if (components.isEmpty || seconds != 0 || centiseconds != 0) {
      components.add('$seconds');
      if (centiseconds != 0) {
        components.add('.');
        components.add(centiseconds.toString().padLeft(2, '0'));
      }
      components.add('s');
    }
    return components.join();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<KanbanTaskCubit>(
      create: (context) => KanbanTaskCubit()..loadData(itemId),
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
              if (state.status == PageStateStatus.loaded ||
                  state.status == PageStateStatus.updated)
                ElevatedButton(
                  onPressed: () {
                    if (!state.timeTrackingStarted) {
                      context
                          .read<KanbanTaskCubit>()
                          .startTimeTracking(taskId: itemId);
                    } else {
                      context
                          .read<KanbanTaskCubit>()
                          .stopTimeTracking(taskId: itemId);
                    }
                  },
                  child: Text(state.timeTrackingStarted
                      ? 'Stop Time Tracking'
                      : 'Start Time Tracking'),
                ),
            ],
          );
        },
      ),
    );
  }
}
