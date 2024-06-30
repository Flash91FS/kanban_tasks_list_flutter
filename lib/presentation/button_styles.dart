import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyle? secondaryButton(BuildContext context) {
    return Theme.of(context).elevatedButtonTheme.style?.copyWith(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.surface),
        elevation: MaterialStateProperty.all(0),
        foregroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor));
  }

  static ButtonStyle? primaryButton(BuildContext context) {
    return Theme.of(context).elevatedButtonTheme.style?.copyWith(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith((states) =>
              getPrimaryButtonBackgroundColor(states, Theme.of(context).primaryColor, context)),
          elevation: MaterialStateProperty.all(0),
          foregroundColor: MaterialStateProperty.resolveWith((states) =>
              getPrimaryButtonForegroundColor(
                  states, Theme.of(context).colorScheme.onPrimary, context)),
        );
  }

  static Color getPrimaryButtonBackgroundColor(
    Set<MaterialState> states,
    Color primary,
    BuildContext context,
  ) {
    if (states.contains(MaterialState.disabled)) {
      return Theme.of(context).colorScheme.tertiary;
    }
    return primary;
  }

  static Color getPrimaryButtonForegroundColor(
    Set<MaterialState> states,
    Color onPrimary,
    BuildContext context,
  ) {
    if (states.contains(MaterialState.disabled)) {
      return Theme.of(context).colorScheme.secondary;
    }
    return onPrimary;
  }
}
