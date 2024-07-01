import 'package:flutter/cupertino.dart';
import 'package:kanban_tasks_list_flutter/utils.dart';

extension ValidationExtension on String {
  ///Title
  String? validTitle({required BuildContext context, bool ignoreEmpty = false}) {
    logData('ValidationExtension', 'validTitle():');
    if (isEmpty && ignoreEmpty) {
      return null;
    } else if (isEmpty) {
      return 'Please enter title';
    } else if (trim().length < 4) {
      return 'Title must have at-least 4 characters';
    } else {
      return null;
    }
  }

  ///Description
  String? validDescription({required BuildContext context, bool ignoreEmpty = false}) {
    logData('ValidationExtension', 'validDescription():');
    if (isEmpty && ignoreEmpty) {
      return null;
    } else if (isEmpty) {
      return 'Please enter description';
    } else if (trim().length < 3) {
      return 'Description must have at-least 3 characters';
    } else {
      return null;
    }
  }
}
