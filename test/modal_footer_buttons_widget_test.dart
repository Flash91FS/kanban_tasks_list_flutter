import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/widgets/modal_footer_buttons_widget.dart';

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

        expect(find.byKey(const Key('Key-ModalFooterButton-Cancel')), findsOneWidget);
        expect(find.byKey(const Key('Key-ModalFooterButton-Next')), findsOneWidget);
        expect(find.text('Cancel'), findsOneWidget);
        expect(find.text('Add Task'), findsOneWidget);
      });
    });


  });
}
