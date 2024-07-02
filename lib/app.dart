import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/api_client/api_client.dart';
import 'package:kanban_tasks_list_flutter/environment_settings.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/comments/comments_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/environment/environment_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/projects/projects_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/sections/sections_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/tasks/tasks_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/bloc/kanban_board/kanban_board_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/bloc/kanban_task/time_tracker_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/kanban_page.dart';
import 'package:kanban_tasks_list_flutter/repository/comments_repository.dart';
import 'package:kanban_tasks_list_flutter/repository/firebase_repository.dart';
import 'package:kanban_tasks_list_flutter/repository/i_comments_repository.dart';
import 'package:kanban_tasks_list_flutter/repository/i_firebase_repository.dart';
import 'package:kanban_tasks_list_flutter/repository/i_projects_repository.dart';
import 'package:kanban_tasks_list_flutter/repository/i_sections_repository.dart';
import 'package:kanban_tasks_list_flutter/repository/i_tasks_repository.dart';
import 'package:kanban_tasks_list_flutter/repository/projects_repository.dart';
import 'package:kanban_tasks_list_flutter/repository/sections_repository.dart';
import 'package:kanban_tasks_list_flutter/repository/tasks_repository.dart';

class App extends StatelessWidget {
  final ApiClient apiClient;
  final String pageTitle;
  final EnvironmentSettings environmentSettings;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  App({
    Key? key,
    required this.apiClient,
    required this.pageTitle,
    required this.environmentSettings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<ITasksRepository>(
              create: (context) => (TasksRepository(apiClient: apiClient))),
          RepositoryProvider<IProjectsRepository>(
              create: (context) => (ProjectsRepository(apiClient: apiClient))),
          RepositoryProvider<ISectionsRepository>(
              create: (context) => (SectionsRepository(apiClient: apiClient))),
          RepositoryProvider<ICommentsRepository>(
              create: (context) => (CommentsRepository(apiClient: apiClient))),
          RepositoryProvider<IFirebaseRepository>(
              create: (context) =>
                  (FirebaseRepository(firestoreInstance: _firestore))),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<EnvironmentCubit>(
              create: (BuildContext context) => EnvironmentCubit(
                baseApiUrl: environmentSettings.baseApiUrl,
                apiToken: environmentSettings.apiToken,
                projectId: environmentSettings.projectId,
                sectionIdToDo: environmentSettings.sectionIdToDo,
                sectionIdInProgress: environmentSettings.sectionIdInProgress,
                sectionIdDone: environmentSettings.sectionIdDone,
              ),
            ),
            BlocProvider(
              create: (context) => TasksCubit(
                tasksRepository:
                    RepositoryProvider.of<ITasksRepository>(context),
                firebaseRepository:
                    RepositoryProvider.of<IFirebaseRepository>(context),
                environmentCubit: BlocProvider.of<EnvironmentCubit>(context),
              )..loadSyncState(),
            ),
            BlocProvider(
              create: (context) => KanbanBoardCubit(
                tasksCubit: BlocProvider.of<TasksCubit>(context),
                firebaseRepository:
                    RepositoryProvider.of<IFirebaseRepository>(context),
                environmentCubit: BlocProvider.of<EnvironmentCubit>(context),
              ),
            ),
            BlocProvider(
              create: (context) => TimeTrackerCubit(
                firebaseRepository:
                    RepositoryProvider.of<IFirebaseRepository>(context),
              ),
            ),
            BlocProvider(
              create: (context) => ProjectsCubit(
                projectsRepository:
                    RepositoryProvider.of<IProjectsRepository>(context),
              ),
            ),
            BlocProvider(
              create: (context) => SectionsCubit(
                sectionsRepository:
                    RepositoryProvider.of<ISectionsRepository>(context),
              ),
            ),
            BlocProvider(
              create: (context) => CommentsCubit(
                commentsRepository:
                    RepositoryProvider.of<ICommentsRepository>(context),
              ),
            ),
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade700),
      ),
      home: KanbanPage(title: pageTitle),
    );
  }
}
