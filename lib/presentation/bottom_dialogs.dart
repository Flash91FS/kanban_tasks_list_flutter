import 'package:flutter/material.dart';

class BottomDialogs {
  static Future<void> showBottomDialog(
    BuildContext context,
    Widget content, {
    double? initialChildSize,
    bool needsMaterialWrapper = false,
    RouteSettings? routeSettings,
    bool? useRootNav,
    bool? fullScreen,
    Key? key,
  }) async {
    final dargController = DraggableScrollableController();
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      useRootNavigator: useRootNav ?? false,
      routeSettings: routeSettings,
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      builder: (context) => needsMaterialWrapper
          ? SizedBox(
              key: key,
              height: fullScreen != null
                  ? MediaQuery.of(context).size.height
                  : MediaQuery.of(context).size.height * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Icon(
                      Icons.remove_rounded,
                      size: 50,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  Expanded(
                    child: content,
                  )
                ],
              ),
            )
          : DraggableScrollableSheet(
              key: key,
              initialChildSize: initialChildSize ?? .5,
              minChildSize: 0.2,
              maxChildSize: 1,
              controller: dargController,
              snap: false,
              snapSizes: const [.3, .5, .6, .75, .85, 1],
              expand: fullScreen ?? false,
              builder: (context, controller) => ListView(
                clipBehavior: Clip.none,
                controller: controller,
                shrinkWrap: true,
                children: [
                  Icon(
                    Icons.remove_rounded,
                    size: 50,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: content,
                  ),
                ],
              ),
            ),
    );
  }
}
