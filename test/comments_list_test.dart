import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/core/page_state_status.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/comments/comments_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/environment/environment_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/projects/projects_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/projects/projects_state.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/sections/sections_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/sections/sections_state.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/tasks/tasks_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/tasks/tasks_state.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/bloc/kanban_board/kanban_board_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/bloc/kanban_board/kanban_board_state.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/bloc/kanban_task/time_tracker_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/bloc/kanban_task/time_tracker_state.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/widgets/comments_list.dart';
import 'package:kanban_tasks_list_flutter/repository/comments_repository.dart';
import 'package:kanban_tasks_list_flutter/repository/firebase_repository.dart';
import 'package:kanban_tasks_list_flutter/repository/projects_repository.dart';
import 'package:kanban_tasks_list_flutter/repository/sections_repository.dart';
import 'package:kanban_tasks_list_flutter/repository/tasks_repository.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_cubits.dart';
import 'mock_data.dart';
import 'mock_repos.dart';

void main() {
  group('Tests for CommentsList view ', () {
    late TasksCubit tasksCubit;
    late KanbanBoardCubit kanbanBoardCubit;
    late TimeTrackerCubit timeTrackerCubit;
    late ProjectsCubit projectsCubit;
    late SectionsCubit sectionsCubit;
    late EnvironmentCubit environmentCubit;
    late CommentsCubit commentsCubit;
    late TasksRepository tasksRepository;
    late ProjectsRepository projectsRepository;
    late SectionsRepository sectionsRepository;
    late CommentsRepository commentsRepository;
    late FirebaseRepository firebaseRepository;

    setUp(() {
      tasksCubit = MockTasksCubit();
      kanbanBoardCubit = MockKanbanBoardCubit();
      timeTrackerCubit = MockTimeTrackerCubit();
      projectsCubit = MockProjectsCubit();
      sectionsCubit = MockSectionsCubit();
      environmentCubit = MockEnvironmentCubit();
      commentsCubit = MockCommentsCubit();
      tasksRepository = MockTasksRepository();
      projectsRepository = MockProjectsRepository();
      sectionsRepository = MockSectionsRepository();
      commentsRepository = MockCommentsRepository();
      firebaseRepository = MockFirebaseRepository();

      when(() => tasksRepository.getTasksList())
          .thenAnswer((_) async => Result.success(data: [mockTask]));
      when(() => projectsRepository.getProjectsList())
          .thenAnswer((_) async => Result.success(data: [mockProject]));
      when(() => sectionsRepository.getSectionsList()).thenAnswer((_) async =>
          Result.success(
              data: [mockSectionToDo, mockSectionInProgress, mockSectionDone]));
      when(() => commentsRepository.getComments(taskId: mockTaskId))
          .thenAnswer((_) async => Result.success(data: [mockComment]));
      when(() => firebaseRepository.getTimeTrackingData(taskId: mockTaskId))
          .thenAnswer((_) async => Result.success(data: mockFirebaseData));

      when(() => environmentCubit.state).thenReturn(EnvironmentState(
        baseApiUrl: mockBaseUrl,
        apiToken: mockApiToken,
        projectId: mockProjectId,
        sectionIdToDo: mockSectionIdToDo,
        sectionIdInProgress: mockSectionIdInProgress,
        sectionIdDone: mockSectionIdDone,
      ));
      when(() => tasksCubit.state).thenReturn(
          TasksState(status: PageStateStatus.loaded, tasks: [mockTask]));
      when(() => kanbanBoardCubit.state)
          .thenReturn(KanbanBoardState(groups: mockGroupsList));
      when(() => timeTrackerCubit.state).thenReturn(TimeTrackerState(
        status: PageStateStatus.loaded,
        taskId: mockTaskId,
        timeSpentMs: 0,
        startTimeMs: 0,
        endTimeMs: 0,
        updatedAt: mockTimestamp.toDate(),
        timeTrackingStarted: false,
        timeDurationToDisplay: '0s',
      ));
      when(() => projectsCubit.state)
          .thenReturn(ProjectsState.loaded(allItems: [mockProject]));
      when(() => sectionsCubit.state).thenReturn(SectionsState.loaded(
          allItems: [mockSectionToDo, mockSectionInProgress, mockSectionDone]));
    });

    testWidgets('CommentsList test', (WidgetTester tester) async {
      await tester.pumpWidget(MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: tasksRepository),
          RepositoryProvider.value(value: projectsRepository),
          RepositoryProvider.value(value: sectionsRepository),
          RepositoryProvider.value(value: commentsRepository),
          RepositoryProvider.value(value: firebaseRepository),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: TasksCubit(
                  tasksRepository: tasksRepository,
                  firebaseRepository: firebaseRepository,
                  environmentCubit: environmentCubit),
            ),
            BlocProvider.value(
              value: kanbanBoardCubit,
            ),
            BlocProvider.value(
              value: timeTrackerCubit,
            ),
            BlocProvider.value(
              value: projectsCubit,
            ),
            BlocProvider.value(
              value: sectionsCubit,
            ),
            BlocProvider.value(
              value: environmentCubit,
            ),
            BlocProvider.value(
              value: CommentsCubit(commentsRepository: commentsRepository),
            ),
          ],
          child: MaterialApp(
              home: Scaffold(
                  body: CommentsList(
            taskId: mockTaskId,
          ))),
        ),
      ));

      await tester.pumpAndSettle();

      expect(find.byKey(Key('Key-Comments-ListView-$mockTaskId')), findsOneWidget);
      expect(find.byKey(Key('Key-CommentItem-${mockComment.id}')), findsOneWidget);
    });
  });
}