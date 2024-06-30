import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_tasks_list_flutter/domain/models/kanban_item_data_model.dart';
import 'package:kanban_tasks_list_flutter/extensions/nullable_date_formatting_extension.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/environment/environment_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/bloc/tasks/tasks_cubit.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/config/kanban_config.dart';
import 'package:kanban_tasks_list_flutter/presentation/popup_dialog.dart';
import 'package:kanban_tasks_list_flutter/presentation/widgets/row_spacer/row_spacer.dart';

class KanbanTaskItemView extends StatelessWidget {
  final String groupId;
  final AppFlowyGroupItem item;
  final AppFlowyBoardController controller;

  const KanbanTaskItemView({
    super.key,
    required this.groupId,
    required this.item,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return kanbanCardItemView(context, item: item, controller: controller);
  }

  Widget kanbanCardItemView(
    BuildContext context, {
    required AppFlowyGroupItem item,
    required AppFlowyBoardController controller,
  }) {
    if (item is KanbanItemDataModel) {
      return DecoratedBox(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(fontSize: 14),
                      textAlign: TextAlign.left,
                    ),
                    if (item.description.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          item.description,
                          style: const TextStyle(
                              fontSize: 12, color: kanbanCardSubtextColor),
                        ),
                      ),
                    if (item.startDate != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Row(
                          children: [
                            Text(
                              item.startDate.format('dd MMM' 'yy'),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: kanbanCardSubtextColor,
                              ),
                            ),
                            if (item.endDate != null)
                              Text(
                                '- ${item.endDate.format('dd MMM' 'yy')}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: kanbanCardSubtextColor,
                                ),
                              )
                          ],
                        ),
                      ),
                  ],
                ),
              ),

              if (groupId !=
                  BlocProvider.of<EnvironmentCubit>(context)
                      .state
                      .sectionIdDone)
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    HapticFeedback.mediumImpact();

                    PopupDialog.confirmationDialog(
                      context,
                      confirmationButtonText: 'Delete Account',
                      title: 'Task Deletion',
                      onConfirm: () {
                        context.read<TasksCubit>().deleteTask(taskId: item.itemId);
                        Navigator.of(context).pop();
                      },
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Are you sure you want you delete this Task?',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                          const RowSpacer(),
                          Text('id: ${item.itemId}'),
                          const SmallRowSpacer(),
                          Text('title: ${item.title}'),
                          if (item.description.isNotEmpty) ...[
                            const SmallRowSpacer(),
                            Text('description: ${item.description}'),
                          ]
                        ],
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.delete_outline,
                    color: deleteIconColor,
                    size: 20,
                  ),
                ),
            ],
          ),
        ),
      );
      //     .onPressedWithHaptic(() {
      //   BottomSheetUtils.bottomSheet(
      //       context: context,
      //       widgetBuilder: (ctx) {
      //         return BlocProvider(
      //           create: (context) => KanbanBloc(),
      //           child: KanbanAddUpdateView(
      //             isAdd: false,
      //             data: KanbanDataModel(
      //                 groupId: groupId,
      //                 itemId: item.itemId,
      //                 title: item.title,
      //                 description: item.description,
      //                 startDate: item.startDate,
      //                 endDate: item.endDate),
      //             onTapCallBack: (value) {
      //               context.read<KanbanBloc>().add(
      //                 KanbanUpdateTask(
      //                   groupId: groupId,
      //                   itemId: item.itemId,
      //                   data: value,
      //                 ),
      //               );
      //             },
      //           ),
      //         );
      //       });
      // });
    }
    throw UnimplementedError();
  }
}
