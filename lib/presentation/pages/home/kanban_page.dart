import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/core/page_state_status.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/tasks/tasks_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/tasks/tasks_state.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/widgets/kanban_board.dart';

class KanbanPage extends StatefulWidget {
  const KanbanPage({super.key, required this.title});

  final String title;

  @override
  State<KanbanPage> createState() => _KanbanPageState();
}

class _KanbanPageState extends State<KanbanPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    context.read<TasksCubit>().loadResults();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        key: const Key('Key-AppBar'),
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<TasksCubit, TasksState>(
                builder: (context, state) {
                  if (state.status == PageStateStatus.loaded ||
                      state.status == PageStateStatus.updated) {
                    return const KanbanBoard(
                      key: Key('Key-KanbanBoard'),
                    );
                  }
                  if (state.status == PageStateStatus.failedToLoad) {
                    return Text(
                        state.errorMessage ?? 'Oops Something Went Wrong!!');
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
