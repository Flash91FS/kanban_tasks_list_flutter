import 'package:flutter/material.dart';
import 'package:kanban_tasks_list_flutter/presentation/dimensions.dart';

class ResponsiveSnackBar {
  static showSnackBar(context, content,
      {Key? bottomSnackBarKey, Key? floatingSnackBarKey, double? shiftSnackbar}) {
    if (Dimensions.isMobile(context)) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(key: bottomSnackBarKey, content: content),
        );
    } else {
      final sideMargin = MediaQuery.of(context).size.width * .30;
      final bottomMargin = MediaQuery.of(context).size.height * .05;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(
                  bottom: bottomMargin, left: sideMargin + (shiftSnackbar ?? 0), right: sideMargin),
              key: floatingSnackBarKey,
              padding: const EdgeInsets.all(24.0),
              elevation: 1000,
              content: content),
        );
    }
  }
}
