import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/api_client/api_client.dart';
import 'package:kanban_tasks_list_flutter/home_page.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/tasks_cubit.dart';
import 'package:kanban_tasks_list_flutter/repository/i_tasks_repository.dart';
import 'package:kanban_tasks_list_flutter/repository/tasks_repository.dart';

class App extends StatelessWidget {
  final ApiClient apiClient;
  final String pageTitle;

  const App({Key? key, required this.apiClient, required this.pageTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<ITasksRepository>(
              create: (context) => (TasksRepository(apiClient: apiClient))),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => TasksCubit(
                    TasksRepository:
                        RepositoryProvider.of<ITasksRepository>(
                            context)))
          ],
          child: AppView(pageTitle: pageTitle),
        ));
  }
}

class AppView extends StatelessWidget {
  final String pageTitle;
  const AppView({super.key, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: pageTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(title: pageTitle),
    );
  }
}


