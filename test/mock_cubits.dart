import 'package:bloc_test/bloc_test.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/comments/comments_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/comments/comments_state.dart';
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

class MockTasksCubit extends MockCubit<TasksState> implements TasksCubit {}

class MockKanbanBoardCubit extends MockCubit<KanbanBoardState>
    implements KanbanBoardCubit {}

class MockTimeTrackerCubit extends MockCubit<TimeTrackerState>
    implements TimeTrackerCubit {}

class MockProjectsCubit extends MockCubit<ProjectsState>
    implements ProjectsCubit {}

class MockSectionsCubit extends MockCubit<SectionsState>
    implements SectionsCubit {}

class MockEnvironmentCubit extends MockCubit<EnvironmentState>
    implements EnvironmentCubit {}

class MockCommentsCubit extends MockCubit<CommentsState>
    implements CommentsCubit {}