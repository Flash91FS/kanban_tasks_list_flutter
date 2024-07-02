import 'package:appflowy_board/appflowy_board.dart';
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
import 'package:kanban_tasks_list_flutter/presentation/pages/home/widgets/kanban_task_item_view.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/widgets/modal_footer_buttons_widget.dart';
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
  group('Tests for ModalFooterButtonsWidget ', () {

    setUp(() {
    });

    testWidgets('ModalFooterButtonsWidget test', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: ModalFooterButtonsWidget(
              cancelBtnName: 'Cancel',
              nxtBtnName: 'Add Task',
              nextTap: () {
              },
              cancelTap: () {
              },
            ),
          ),
        ));

        await tester.pumpAndSettle();

        expect(find.byKey(const Key('Key-ModalFooterButton-Cancel'),), findsOneWidget);
        expect(find.byKey(const Key('Key-ModalFooterButton-Next'),), findsOneWidget);
        expect(find.text('Cancel'), findsOneWidget);
        expect(find.text('Add Task'), findsOneWidget);
      });
    });


  });
}
