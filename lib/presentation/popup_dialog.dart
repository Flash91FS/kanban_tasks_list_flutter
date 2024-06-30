import 'package:flutter/material.dart';
import 'package:kanban_tasks_list_flutter/presentation/button_styles.dart';
import 'package:kanban_tasks_list_flutter/presentation/widgets/row_spacer/row_spacer.dart';

class PopupDialog {
  static showPopupDialog(
    BuildContext context,
    Widget content, {
    bool needsMaterialWrapper = false,
    RouteSettings? routeSettings,
    final double? popUpHeight,
    Key? key,
    bool? useRootNav,
    required bool isBarrierDismissable,
  }) async =>
      await showDialog(
        context: context,
        useRootNavigator: useRootNav ?? false,
        routeSettings: routeSettings,
        barrierDismissible: isBarrierDismissable,
        builder: (BuildContext context) {
          return needsMaterialWrapper
              ? Center(
                  key: key,
                  child: Container(
                    margin: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: const BorderRadius.all(Radius.circular(12))),
                    constraints: BoxConstraints(
                        maxWidth: 480,
                        maxHeight: popUpHeight != null
                            ? MediaQuery.of(context).size.height * popUpHeight
                            : 700),
                    child: Material(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      clipBehavior: Clip.hardEdge,
                      type: MaterialType.transparency,
                      child: content,
                    ),
                  ),
                )
              : Center(
                  key: key,
                  child: Container(
                    margin: const EdgeInsets.all(30),
                    constraints: BoxConstraints(
                        maxHeight: popUpHeight != null
                            ? MediaQuery.of(context).size.height * popUpHeight
                            : 700,
                        maxWidth: 480),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: const BorderRadius.all(Radius.circular(12))),
                    child: Builder(
                      builder: (context) {
                        return SingleChildScrollView(child: content);
                      },
                    ),
                  ),
                );
        },
      );


  static confirmationDialog(
    BuildContext context, {
    String? title,
    required Function onConfirm,
    required Widget body,
    bool deEmphasizeCancelButton = true,
    bool deEmphasizeConfirmButton = false,
    String? confirmationButtonText,
  }) async =>
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  color: Theme.of(context).colorScheme.surface,
                ),
                margin: const EdgeInsets.all(30),
                padding: const EdgeInsets.all(30),
                constraints: const BoxConstraints(maxWidth: 480, maxHeight: 350, minWidth: 320),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title != null) ...[
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                    const LargeRowSpacer(),
                    body,
                    const LargeRowSpacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: SizedBox(
                            width: 180,
                            height: 40,
                            child: deEmphasizeCancelButton
                                ? ElevatedButton(
                                    style: ButtonStyles.secondaryButton(context),
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: const Text('Cancel'))
                                : ElevatedButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: const Text('Cancel')),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Flexible(
                            child: SizedBox(
                          width: 180,
                          height: 40,
                          child: deEmphasizeConfirmButton
                              ? ElevatedButton(
                                  style: ButtonStyles.secondaryButton(context),
                                  onPressed: () => onConfirm(),
                                  child: Text(confirmationButtonText ?? 'Confirm'))
                              : ElevatedButton(
                                  onPressed: () => onConfirm(),
                                  child: Text(confirmationButtonText ?? 'Confirm')),
                        )),
                      ],
                    )
                  ],
                ),
              ),
            );
          });
}
