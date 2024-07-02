import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/widgets/modal_header_text_widgets.dart';

void main() {
  group('Tests for ModalHeaderTextWidget ', () {

    setUp(() {
    });

    testWidgets('ModalHeaderTextWidget test', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
            body: ModalHeaderTextWidgets(
              header: 'Add Task',
            ),
          ),
        ));

        await tester.pumpAndSettle();

        expect(find.byKey(const Key('Key-ModalHeaderTextWidgets-Header')), findsOneWidget);
        expect(find.byKey(const Key('Key-ModalHeaderTextWidgets-CloseIcon')), findsOneWidget);
        expect(find.text('Add Task'), findsOneWidget);
      });
    });


  });
}
