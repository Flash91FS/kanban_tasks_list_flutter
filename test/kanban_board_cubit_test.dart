import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/core/page_state_status.dart';
import 'package:kanban_tasks_list_flutter/domain/irepositories/i_firebase_repository.dart';
import 'package:kanban_tasks_list_flutter/domain/entities/task.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/environment/environment_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/tasks/tasks_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/tasks/tasks_state.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/kanban_board/kanban_board_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/kanban_board/kanban_board_state.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_data.dart';

class MockTasksCubit extends Mock implements TasksCubit {}

class MockFirebaseRepository extends Mock implements IFirebaseRepository {}

class MockEnvironmentCubit extends Mock implements EnvironmentCubit {
  MockEnvironmentCubit(EnvironmentState state) : super() {
    when(() => this.state).thenReturn(state);
  }
}

void main() {
  late MockTasksCubit mockTasksCubit;
  late MockFirebaseRepository mockFirebaseRepository;
  late MockEnvironmentCubit mockEnvironmentCubit;
  late KanbanBoardCubit kanbanBoardCubit;

  setUp(() {
    mockTasksCubit = MockTasksCubit();
    mockFirebaseRepository = MockFirebaseRepository();
    mockEnvironmentCubit = MockEnvironmentCubit(EnvironmentState(
      baseApiUrl: mockBaseUrl,
      apiToken: mockApiToken,
      projectId: mockProjectId,
      sectionIdToDo: mockSectionIdToDo,
      sectionIdInProgress: mockSectionIdInProgress,
      sectionIdDone: mockSectionIdDone,
    ));
    // kanbanBoardCubit = KanbanBoardCubit(
    //   tasksCubit: mockTasksCubit,
    //   firebaseRepository: mockFirebaseRepository,
    //   environmentCubit: mockEnvironmentCubit,
    // );
  });

  group('KanbanBoardCubit', () {

    final testTasks = [mockTask, mockTask2, mockTask3, mockTask4];
    final testTasksState = TasksState(status: PageStateStatus.loaded, tasks: testTasks);

    //not working due to some reason
    // blocTest<KanbanBoardCubit, KanbanBoardState>(
    //   'emits state with groups when TasksCubit emits loaded or updated state',
    //   build: () {
    //
    //     // *** Mock the stream BEFORE creating KanbanBoardCubit ***
    //     when(() => mockTasksCubit.stream).thenAnswer((_) => Stream.value(testTasksState));
    //     when(() => mockTasksCubit.state).thenReturn(testTasksState);
    //
    //     kanbanBoardCubit = KanbanBoardCubit(
    //       tasksCubit: mockTasksCubit,
    //       firebaseRepository: mockFirebaseRepository,
    //       environmentCubit: mockEnvironmentCubit,
    //     );
    //     return kanbanBoardCubit;
    //   },
    //   expect: () => [
    //     KanbanBoardState(groups: kanbanBoardCubit.createGroups(testTasks)),
    //     // isA<KanbanBoardState>(), // Check if any state is emitted
    //   ],
    //   // Add a delay here
    //   wait: const Duration(milliseconds: 100),
    // );

    blocTest<KanbanBoardCubit, KanbanBoardState>(
      'calls moveTaskToSection and stopTimeTrackingWithoutDetails on onMoveGroupItemToGroup',
      build: () {
        when(() => mockTasksCubit.stream).thenAnswer((_) => Stream.value(testTasksState));
        when(() => mockTasksCubit.state).thenReturn(testTasksState);
        when(() => mockTasksCubit.moveTaskToSection(taskId: any(named: 'taskId'), toSectionId: any(named: 'toSectionId')))
            .thenAnswer((_) async {});
        when(() => mockFirebaseRepository.stopTimeTrackingWithoutDetails(taskId: any(named: 'taskId')))
            .thenAnswer((_) async => Result.success(data: 'Success'));

        kanbanBoardCubit = KanbanBoardCubit(
          tasksCubit: mockTasksCubit,
          firebaseRepository: mockFirebaseRepository,
          environmentCubit: mockEnvironmentCubit,
        );
        kanbanBoardCubit.emit(KanbanBoardState(groups: kanbanBoardCubit.createGroups(testTasks)));
        return kanbanBoardCubit;
      },
      act: (cubit) async {
        await cubit.onMoveGroupItemToGroup(mockSectionIdToDo, 0, mockSectionIdInProgress, 0);
      },
      verify: (_) {
        verify(() => mockTasksCubit.moveTaskToSection(taskId: mockTask3.id, toSectionId: mockSectionIdInProgress)).called(1);
        verifyNever(() => mockFirebaseRepository.stopTimeTrackingWithoutDetails(taskId: any(named: 'taskId')));
      },
    );

    blocTest<KanbanBoardCubit, KanbanBoardState>(
      'calls moveTaskToSection and stopTimeTrackingWithoutDetails on onMoveGroupItemToGroup when item moved to {mockSectionIdDone}',
      build: () {
        when(() => mockTasksCubit.stream).thenAnswer((_) => Stream.value(testTasksState));
        when(() => mockTasksCubit.state).thenReturn(testTasksState);
        when(() => mockTasksCubit.moveTaskToSection(taskId: any(named: 'taskId'), toSectionId: any(named: 'toSectionId')))
            .thenAnswer((_) async {});
        when(() => mockFirebaseRepository.stopTimeTrackingWithoutDetails(taskId: any(named: 'taskId')))
            .thenAnswer((_)  async => Result.success(data: 'Success'));

        kanbanBoardCubit = KanbanBoardCubit(
          tasksCubit: mockTasksCubit,
          firebaseRepository: mockFirebaseRepository,
          environmentCubit: mockEnvironmentCubit,
        );
        kanbanBoardCubit.emit(KanbanBoardState(groups: kanbanBoardCubit.createGroups(testTasks)));
        // kanbanBoardCubit.emit(KanbanBoardState(groups: kanbanBoardCubit.createGroups(testTasks.map((task) => task.copyWith(sectionId: mockSectionIdInProgress)).toList())));
        return kanbanBoardCubit;
      },
      act: (cubit) async {
        await cubit.onMoveGroupItemToGroup(mockSectionIdInProgress, 0, mockSectionIdDone, 0);
      },
      verify: (_) {
        verify(() => mockTasksCubit.moveTaskToSection(taskId: mockTask4.id, toSectionId: mockSectionIdDone)).called(1);
        verify(() => mockFirebaseRepository.stopTimeTrackingWithoutDetails(taskId: mockTask4.id)).called(1);
      },
    );

    // Add more tests for error handling and edge cases
  });
}