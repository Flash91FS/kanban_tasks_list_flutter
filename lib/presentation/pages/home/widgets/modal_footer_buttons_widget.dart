import 'package:flutter/material.dart';
import 'package:kanban_tasks_list_flutter/presentation/button_styles.dart';

class ModalFooterButtonsWidget extends StatelessWidget {
  final String nxtBtnName;
  final VoidCallback nextTap;
  final String cancelBtnName;
  final VoidCallback cancelTap;

  const ModalFooterButtonsWidget({
    super.key,
    required this.nxtBtnName,
    required this.nextTap,
    required this.cancelBtnName,
    required this.cancelTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
            key: const Key('Key-ModalFooterButton-Cancel'),
            style: ButtonStyles.secondaryButton(context),
            onPressed: () => Navigator.of(context).pop(),
            child: Text(cancelBtnName)),
        const SizedBox(width: 20),
        ElevatedButton(
            key: const Key('Key-ModalFooterButton-Next'),
            onPressed: nextTap,
            child: Text(nxtBtnName)),
      ],
    );
  }
}
