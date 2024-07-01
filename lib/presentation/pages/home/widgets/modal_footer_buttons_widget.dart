import 'package:flutter/material.dart';
import 'package:kanban_tasks_list_flutter/presentation/button_styles.dart';


class ModalFooterButtonsWidget extends StatelessWidget {
  final bool isValidNext;
  final String nxtBtnName;
  final VoidCallback nextTap;
  final String cancelBtnName;
  final VoidCallback cancelTap;

  const ModalFooterButtonsWidget({
    super.key,
    required this.isValidNext,
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
            style: ButtonStyles.secondaryButton(context),
            onPressed: () => Navigator.of(context).pop(),
            child: Text(cancelBtnName)),
        const SizedBox(width: 20),
        ElevatedButton(
            onPressed: nextTap,
            child: Text(nxtBtnName)),
      ],
    );
  }
}
