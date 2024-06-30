import 'package:flutter/material.dart';
import 'package:kanban_tasks_list_flutter/presentation/bottom_dialogs.dart';
import 'package:kanban_tasks_list_flutter/presentation/dimensions.dart';
import 'package:kanban_tasks_list_flutter/presentation/popup_dialog.dart';

class ResponsiveDialog {
  static showResponsiveDialog(
    context,
    content, {
    double? initialChildSize,
    bool needsMaterialWrapper = false,
    RouteSettings? routeSettings,
    Key? bottomDialogKey,
    Key? popUpDialogKey,
    double? popUpHeight,
    bool? fullScreen,
    bool? useRootNav,
    bool isBarrierDismissable = true,
  }) {
    if (Dimensions.isMobile(context)) {
      return BottomDialogs.showBottomDialog(
        context,
        content,
        initialChildSize: initialChildSize,
        needsMaterialWrapper: needsMaterialWrapper,
        routeSettings: routeSettings,
        useRootNav: useRootNav,
        fullScreen: fullScreen,
        key: bottomDialogKey,
      );
    } else {
      return PopupDialog.showPopupDialog(
        context,
        content,
        needsMaterialWrapper: needsMaterialWrapper,
        routeSettings: routeSettings,
        popUpHeight: popUpHeight,
        isBarrierDismissable: isBarrierDismissable,
        useRootNav: useRootNav,
        key: popUpDialogKey,
      );
    }
  }

  static showFormDialog(
    context,
    content, {
    double? initialChildSize,
    bool needsMaterialWrapper = false,
    RouteSettings? routeSettings,
    Key? bottomDialogKey,
    Key? popUpDialogKey,
    double? popUpHeight,
    bool? fullScreen,
    bool? useRootNav,
    bool isBarrierDismissable = true,
  }) {
    if (Dimensions.isMobile(context)) {
      return BottomDialogs.showBottomDialog(
        context,
        content,
        initialChildSize: initialChildSize,
        needsMaterialWrapper: needsMaterialWrapper,
        routeSettings: routeSettings,
        useRootNav: useRootNav,
        fullScreen: fullScreen,
        key: bottomDialogKey,
      );
    } else {
      return showDialog(
        context: context,
        useRootNavigator: useRootNav ?? false,
        routeSettings: routeSettings,
        barrierDismissible: isBarrierDismissable,
        builder: (BuildContext context) {
          return Center(
            key: popUpDialogKey,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15))),
              constraints: const BoxConstraints(
                maxWidth: 546, maxHeight: 579
              ),
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                clipBehavior: Clip.hardEdge,
                type: MaterialType.transparency,
                child: content,
              ),
            ),
          );
        },
      );
    }
  }
}
