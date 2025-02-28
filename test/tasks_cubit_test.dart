import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_tasks_list_flutter/core/models/result.dart';
import 'package:kanban_tasks_list_flutter/core/page_state_status.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/environment/environment_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/tasks/tasks_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/tasks/tasks_state.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_data.dart';
import 'mock_repos.dart';

class MockEnvironmentCubit extends Mock implements EnvironmentCubit {
  MockEnvironmentCubit(EnvironmentState state) : super() {
    when(() => this.state).thenReturn(state);
  }
}

void main() {
  late MockTasksRepository mockTasksRepository;
  late MockFirebaseRepository mockFirebaseRepository;
  late MockEnvironmentCubit mockEnvironmentCubit;
  late TasksCubit tasksCubit;

  setUp(() {
    mockTasksRepository = MockTasksRepository();
    mockFirebaseRepository = MockFirebaseRepository();
    mockEnvironmentCubit = MockEnvironmentCubit(const EnvironmentState(
      baseApiUrl: 'test',
      apiToken: 'test',
      projectId: '2203306141',
      sectionIdToDo: 'todo',
      sectionIdInProgress: 'inprogress',
      sectionIdDone: 'done',
    ));
    tasksCubit = TasksCubit(
      tasksRepository: mockTasksRepository,
      firebaseRepository: mockFirebaseRepository,
      environmentCubit: mockEnvironmentCubit,
    );
  });

  group('TasksCubit', () {
    final testTasks = [
      mockTask,
      mockTask2,
      // Task(
      //     id: '1',
      //     projectId: 'project1',
      //     sectionId: 'todo',
      //     title: 'Task 1',
      //     description: 'Desc 1'),
      // Task(
      //     id: '2',
      //     projectId: 'project1',
      //     sectionId: 'inprogress',
      //     title: 'Task 2',
      //     description: 'Desc 2'),
      // Task(
      //     id: '3',
      //     projectId: 'project2',
      //     sectionId: 'done',
      //     title: 'Task 3',
      //     description: 'Desc 3'),
    ];

    blocTest<TasksCubit, TasksState>(
      'emits loaded state with tasks on successful loadResults',
      build: () {
        when(() => mockTasksRepository.getTasksList())
            .thenAnswer((_) async => Result.success(data: testTasks));
        return tasksCubit;
      },
      act: (cubit) => cubit.loadResults(),
      expect: () => [
        TasksState(
          status: PageStateStatus.loaded,
          tasks: testTasks.where((task) => task.projectId == '2203306141').toList(),
        ),
      ],
    );

    blocTest<TasksCubit, TasksState>(
      'emits failedToLoad state on failed loadResults',
      build: () {
        when(() => mockTasksRepository.getTasksList())
            .thenAnswer((_) async => Result.failure(error: Exception()));
        return tasksCubit;
      },
      act: (cubit) => cubit.loadResults(),
      expect: () => [
        TasksState(
          status: PageStateStatus.failedToLoad,
          errorMessage: 'Failed to load Tasks.',
        ),
      ],
    );

    blocTest<TasksCubit, TasksState>(
      'emits updated state with new task on successful addNewTask',
      build: () {
        when(() => mockTasksRepository.addNewTask(
          projectId: any(named: 'projectId'),
          sectionId: any(named: 'sectionId'),
          title: any(named: 'title'),
          description: any(named: 'description'),
        )).thenAnswer((_) async => Result.success(data: testTasks[0]));
        when(() => mockFirebaseRepository.postTimeTrackingDataForTask(
            taskId: any(named: 'taskId')))
            .thenAnswer((_) async => Result.success(data: 'Success'));
        return tasksCubit;
        // return tasksCubit..emit(TasksState(status: PageStateStatus.loaded, tasks: []));
      },
      act: (cubit) => cubit.addNewTask(
          projectId: '2203306141',
          sectionId: 'todo',
          title: 'New Task',
          description: 'New Desc'),
      expect: () => [
        TasksState(
          status: PageStateStatus.updated,
          tasks: [testTasks[0]],
        ),
      ],
    );

    // Add more tests for updateTask, deleteTask, loadSyncState, and moveTaskToSection
    //...

    blocTest<TasksCubit, TasksState>(
      'emits updated state with updated task on successful updateTask',
      build: () {
        when(() => mockTasksRepository.updateTask(
          taskId: any(named: 'taskId'),
          title: any(named: 'title'),
          description: any(named: 'description'),
        )).thenAnswer((_) async => Result.success(data: mockTask.copyWith(content: 'Updated Task', description: 'Updated Desc')));
        return tasksCubit..emit(TasksState(status: PageStateStatus.loaded, tasks: testTasks)); // Initial state with tasks
      },
      act: (cubit) => cubit.updateTask(taskId: mockTask.id, title: 'Updated Task', description: 'Updated Desc'),
      expect: () => [
        TasksState(
          status: PageStateStatus.updated,
          tasks: [mockTask.copyWith(content: 'Updated Task', description: 'Updated Desc'), mockTask2],
        ),
      ],
    );

    blocTest<TasksCubit, TasksState>(
      'emits updated state with task removed on successful deleteTask',
      build: () {
        when(() => mockTasksRepository.deleteTask(taskId: any(named: 'taskId')))
            .thenAnswer((_) async => Result.success(data: 'Task deleted'));
        return tasksCubit..emit(TasksState(status: PageStateStatus.loaded, tasks: testTasks)); // Initial state with tasks
      },
      act: (cubit) => cubit.deleteTask(taskId: mockTask.id),
      expect: () => [
        TasksState(
          status: PageStateStatus.updated,
          tasks: [mockTask2],
        ),
      ],
    );

    blocTest<TasksCubit, TasksState>(
      'emits state with syncToken on successful loadSyncState',
      build: () {
        when(() => mockTasksRepository.loadSyncState())
            .thenAnswer((_) async => Result.success(data: 'testSyncToken'));
        return tasksCubit;
      },
      act: (cubit) => cubit.loadSyncState(),
      expect: () => [
        tasksCubit.state.copyWith(syncToken: 'testSyncToken'),
      ],
    );

    blocTest<TasksCubit, TasksState>(
      'emits updated state with moved task on successful moveTaskToSection',
      build: () {
        when(() => mockTasksRepository.moveTaskToSection(
          syncToken: any(named: 'syncToken'),
          uuid: any(named: 'uuid'),
          taskId: any(named: 'taskId'),
          toSectionId: any(named: 'toSectionId'),
        )).thenAnswer((_) async => Result.success(data: 'testSyncToken'));
        return tasksCubit
          ..emit(TasksState(status: PageStateStatus.loaded, tasks: testTasks, syncToken: 'initialSyncToken')); // Initial state with tasks
      },
      act: (cubit) async => await cubit.moveTaskToSection(taskId: mockTask.id, toSectionId: 'inprogress'),
      expect: () => [
        TasksState(
          status: PageStateStatus.updated,
          tasks: [mockTask.copyWith(sectionId: 'inprogress'), mockTask2],
          syncToken: 'testSyncToken',
        ),
      ],
    );


  });
}