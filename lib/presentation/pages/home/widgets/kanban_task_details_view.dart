import 'package:flutter/material.dart';

import 'package:kanban_tasks_list_flutter/domain/models/kanban_item_data_model.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/widgets/modal_footer_buttons_widget.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/widgets/modal_header_text_widgets.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/widgets/text_form_field_widget.dart';

import 'package:kanban_tasks_list_flutter/extensions/validation_extension.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/widgets/time_tracker_widget.dart';
import 'package:kanban_tasks_list_flutter/utils.dart';

class KanbanTaskDetailsView extends StatefulWidget {
  final bool isAdd;
  final bool isDetailOnly;
  final String sectionId;
  final KanbanItemDataModel? data;
  final Function(KanbanItemDataModel) onTapCallBack;

  const KanbanTaskDetailsView({
    super.key,
    required this.isAdd,
    this.isDetailOnly = false,
    required this.sectionId,
    required this.data,
    required this.onTapCallBack,
  });

  @override
  State<KanbanTaskDetailsView> createState() => _KanbanTaskDetailsViewState();
}

class _KanbanTaskDetailsViewState extends State<KanbanTaskDetailsView> {
  final formKey = GlobalKey<FormState>();
  ValueNotifier<bool> isEnable = ValueNotifier(false);
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    super.initState();
    initialData();

    if (!widget.isDetailOnly && widget.isAdd) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        formKey.currentState!.validate();
      });
    }
  }

  Future<void> initialData() async {
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      titleController.text = widget.data?.title ?? '';
      descriptionController.text = widget.data?.description ?? '';
      startDate = widget.data?.startDate;
      endDate = widget.data?.endDate;
      if (widget.data != null && !widget.isDetailOnly) {
        isEnable.value = formKey.currentState?.validate() ?? false;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    logData(TAG_KANBAN_BOARD, 'build():');
    return ValueListenableBuilder(
      valueListenable: isEnable,
      builder: (context, isEnableBool, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///Header and Close Button
                ModalHeaderTextWidgets(
                  header: widget.isDetailOnly
                      ? widget.data?.itemId ?? ''
                      : (widget.isAdd ? 'Add Task' : 'Edit/Update Task'),
                  onBack: () {},
                ),
                // Expanded(
                //   child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///Title
                    TextFormFieldWidget(
                      isEnabled: !widget.isDetailOnly,
                      controller: titleController,
                      hintText: 'Title',
                      mandatory: true,
                      mandatoryText: '*',
                      onChange: (value) {
                        enable();
                      },
                      validate: (value) {
                        return value
                            .toString()
                            .validTitle(context: context, ignoreEmpty: false);
                      },
                    ),
                    const SizedBox(height: 12),

                    ///Description
                    TextFormFieldWidget(
                      isEnabled: !widget.isDetailOnly,
                      controller: descriptionController,
                      maxLines: 4,
                      hintText: 'Description',
                      onChange: (value) {
                        enable();
                      },
                      validate: (value) {
                        return value
                            .toString()
                            .validDescription(context: context);
                      },
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
                if (!widget.isDetailOnly)
                  ModalFooterButtonsWidget(
                    isValidNext: isEnableBool,
                    cancelBtnName: 'Cancel',
                    nxtBtnName: widget.isAdd ? 'Add Task' : 'Update Task',
                    nextTap: () async {
                      formKey.currentState!.validate();
                      if (isEnableBool) {
                        logData(TAG_KANBAN_BOARD, 'Add Task');

                        final kanbanItemDataModel = KanbanItemDataModel(
                          groupId: widget.sectionId,
                          itemId: widget.data?.itemId ?? '',
                          title: titleController.text,
                          description: descriptionController.text,
                          createdDate: widget.isAdd
                              ? DateTime.now()
                              : widget.data?.createdDate,
                          updatedDate: !widget.isAdd
                              ? DateTime.now()
                              : widget.data?.updatedDate,
                          startDate: startDate,
                          endDate: endDate,
                        );
                        logData(TAG_KANBAN_BOARD,
                            'kanbanItemDataModel: title: ${kanbanItemDataModel.title}');
                        logData(TAG_KANBAN_BOARD,
                            'kanbanItemDataModel: description: ${kanbanItemDataModel.description}');
                        widget.onTapCallBack(kanbanItemDataModel);
                        Navigator.of(context).pop();
                      } else {
                        logData(TAG_KANBAN_BOARD, 'Do Nothing');
                      }
                    },
                    cancelTap: () {
                      Navigator.of(context).pop();
                    },
                  ),

                if (widget.isDetailOnly && widget.data != null)
                  TimeTrackerWidget(taskItem: widget.data!),

                SizedBox(
                    height: MediaQuery.paddingOf(context).bottom +
                        MediaQuery.viewInsetsOf(context).bottom +
                        10),
              ],
            ),
          ),
          // ),
        );
      },
    );
  }

  ///enable - Enables Add/Update Button
  bool enable() {
    isEnable.value = (formKey.currentState?.validate() ?? false) &&
        titleController.text.length >= 4;
    return isEnable.value;
  }
}
