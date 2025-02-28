import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/core/extensions/validation_extension.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/comments/comments_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/util_widgets/text_form_field_widget.dart';

class AddCommentWidget extends StatefulWidget {
  final String taskId;

  const AddCommentWidget({super.key, required this.taskId});

  @override
  State<AddCommentWidget> createState() => _AddCommentWidgetState();
}

class _AddCommentWidgetState extends State<AddCommentWidget> {
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
    return ValueListenableBuilder(
      valueListenable: isEnable,
      builder: (context, isEnableBool, child) {
        return Form(
          key: formKey,
          child: Row(
            children: [
              Expanded(
                child: TextFormFieldWidget(
                  key: Key('Key-AddCommentWidget-TextField-${widget.taskId}'),
                  controller: commentController,
                  maxLines: 1,
                  hintText: 'Post a Comment',
                  onChange: (value) {
                    enable();
                  },
                  validate: (value) {
                    return value
                        .toString()
                        .validComment(context: context, ignoreEmpty: true);
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                key: Key('Key-AddCommentWidget-SendButton-${widget.taskId}'),
                onTap: () {
                  formKey.currentState!.validate();
                  if (isEnableBool) {
                    context.read<CommentsCubit>().addNewComment(
                        taskId: widget.taskId, content: commentController.text);
                    commentController.text = '';
                  } else {}
                },
                child: const Icon(
                  Icons.send,
                  color: Colors.blue,
                  size: 20,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  bool enable() {
    isEnable.value = (formKey.currentState?.validate() ?? false) &&
        commentController.text.length >= 4;
    return isEnable.value;
  }
}
