import 'package:flutter/material.dart';
import 'package:kanban_tasks_list_flutter/domain/models/comment.dart';
import 'package:kanban_tasks_list_flutter/extensions/nullable_date_formatting_extension.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/config/kanban_config.dart';
import 'package:kanban_tasks_list_flutter/presentation/widgets/row_spacer/row_spacer.dart';

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
          comment.content,
          style: const TextStyle(fontSize: 14),
          textAlign: TextAlign.left,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            comment.postedAt.format('dd MMM ' 'yy'),
            style: const TextStyle(fontSize: 10, color: kanbanCardSubtextColor),
          ),
        ),
        const SmallRowSpacer(),
      ],
    );
  }
}
