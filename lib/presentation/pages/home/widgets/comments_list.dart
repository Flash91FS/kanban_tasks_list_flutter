import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/core/page_state_status.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/comments/comments_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/comments/comments_state.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/widgets/comment_item.dart';

class CommentsList extends StatefulWidget {
  final String taskId;

  const CommentsList({super.key, required this.taskId});

  @override
  State<CommentsList> createState() => _CommentsListState();
}

class _CommentsListState extends State<CommentsList> {
  final TextEditingController commentController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ValueNotifier<bool> isEnable = ValueNotifier(false);

  @override
  void initState() {
    context.read<CommentsCubit>().loadComments(taskId: widget.taskId);
    super.initState();
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentsCubit, CommentsState>(
      builder: (context, state) {
        if ((state.status == PageStateStatus.loaded ||
                state.status == PageStateStatus.updated) &&
            state.comments != null) {
          return ListView.builder(
              key: Key('Key-Comments-ListView-${widget.taskId}'),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.comments!.length,
              itemBuilder: (context, index) {
                return CommentItem(
                    key: Key('Key-CommentItem-${state.comments![index].id}'),
                    comment: state.comments![index]);
              });
        }
        if (state.status == PageStateStatus.failedToLoad) {
          return const Text('Failed to load Comments');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  bool enable() {
    isEnable.value = (formKey.currentState?.validate() ?? false) &&
        commentController.text.length >= 4;
    return isEnable.value;
  }
}
