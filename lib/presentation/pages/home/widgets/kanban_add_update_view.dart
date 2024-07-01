import 'package:flutter/material.dart';

import 'package:kanban_tasks_list_flutter/domain/models/kanban_item_data_model.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/widgets/modal_footer_buttons_widget.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/widgets/modal_header_text_widgets.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/widgets/text_form_field_widget.dart';

import 'package:kanban_tasks_list_flutter/extensions/validation_extension.dart';
import 'package:kanban_tasks_list_flutter/utils.dart';


class KanbanAddUpdateView extends StatefulWidget {
  final bool isAdd;
  final KanbanItemDataModel? data;
  final Function(KanbanItemDataModel) onTapCallBack;

  const KanbanAddUpdateView({
    super.key,
    required this.isAdd,
    required this.data,
    required this.onTapCallBack,
  });

  @override
  State<KanbanAddUpdateView> createState() => _KanbanAddUpdateViewState();
}

class _KanbanAddUpdateViewState extends State<KanbanAddUpdateView> {
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

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   formKey.currentState?.validate();
    // });
  }

  Future<void> initialData() async {
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      titleController.text = widget.data?.title ?? '';
      descriptionController.text = widget.data?.description ?? '';
      startDate = widget.data?.startDate;
      endDate = widget.data?.endDate;
      if (widget.data != null) {
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
        return
            // FractionallySizedBox(
            // heightFactor: 0.8,
            // widthFactor: 1,
            // child:
            Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Header and Close Button
                ModalHeaderTextWidgets(
                  header: widget.isAdd ? 'Add Task' : 'Update Task',
                  onBack: () {},
                ),
                // Expanded(
                //   child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///Title
                    TextFormFieldWidget(
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
                      controller: descriptionController,
                      maxLines: 4,
                      hintText: 'Description',
                      onChange: (value) {
                        enable();
                      },
                      validate: (value) {
                        return value.toString().validDescription(
                            context: context, ignoreEmpty: true);
                      },
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
                ModalFooterButtonsWidget(
                  isValidNext: isEnableBool,
                  cancelBtnName: 'Cancel',
                  nxtBtnName: widget.isAdd ? 'Add Task' : 'Update Task',
                  nextTap: () async {
                    if (isEnableBool) {

                      logData(TAG_KANBAN_BOARD, 'Add Task');

                      final kanbanItemDataModel = KanbanItemDataModel(
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
