import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/domain/models/task.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/tasks_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/tasks_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<TasksCubit, TasksState>(
                builder: (context, state) {
                  return state.when(
                      loaded: (
                        allItems,
                      ) {
                        return LayoutBuilder(builder: (context, constraints) {
                          return _buildList(context, allItems);
                        });
                      },
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      failedToLoad: () =>
                          const Text('Oops Something Went Wrong!!'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildList(BuildContext context, List<Task> tasksList) {
  if (tasksList.isNotEmpty) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1320),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          padding: EdgeInsets.all(10),
          itemCount: tasksList.length,
          itemBuilder: (BuildContext context, int i) {
            return _buildRow(context, tasksList[i]);
          },
        ),
      ),
    );
  } else {
    return const Center(child: Text("You're all caught up on your messages!"));
  }
}

Widget _buildRow(BuildContext context, Task task) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.only(right: 13.0),
              child: Text(task.content,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  // style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Text(task.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).colorScheme.outline)),
    ],
  );
}
