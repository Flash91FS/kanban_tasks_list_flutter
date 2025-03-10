import 'package:flutter/material.dart';
import 'package:kanban_tasks_list_flutter/domain/entities/comment.dart';
import 'package:kanban_tasks_list_flutter/core/extensions/nullable_date_formatting_extension.dart';
import 'package:kanban_tasks_list_flutter/presentation/config/kanban_config.dart';
import 'package:kanban_tasks_list_flutter/presentation/util_widgets/row_spacer.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;

  const CommentItem({
    super.key,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          key: Key('Key-CommentItem-Content-${comment.id}'),
          comment.content,
          style: const TextStyle(fontSize: 14),
          textAlign: TextAlign.left,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            key: Key('Key-CommentItem-PostedAt-${comment.id}'),
            comment.postedAt.format('dd MMM ' 'yy'),
            style: const TextStyle(fontSize: 10, color: kanbanCardSubtextColor),
          ),
        ),
        const SmallRowSpacer(),
      ],
    );
  }
}
