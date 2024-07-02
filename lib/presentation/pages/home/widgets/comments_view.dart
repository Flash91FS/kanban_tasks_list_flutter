import 'package:flutter/material.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/widgets/add_comment_widget.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/widgets/comments_list.dart';
import 'package:kanban_tasks_list_flutter/presentation/widgets/row_spacer/row_spacer.dart';

class CommentsView extends StatelessWidget {
  final String taskId;

  const CommentsView({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          AddCommentWidget(
              key: Key('Key-AddCommentWidget-$taskId'),
              taskId: taskId),
          const RowSpacer(),
          CommentsList(
              key: Key('Key-CommentsList-$taskId'),
              taskId: taskId),
        ],
      ),
    );
  }
}
