import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyle? secondaryButton(BuildContext context) {
    return Theme.of(context).elevatedButtonTheme.style?.copyWith(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
        backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.surface),
        elevation: WidgetStateProperty.all(0),
        foregroundColor: WidgetStateProperty.all(Theme.of(context).primaryColor));
  }

  static ButtonStyle? primaryButton(BuildContext context) {
    return Theme.of(context).elevatedButtonTheme.style?.copyWith(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor: WidgetStateProperty.resolveWith((states) =>
              getPrimaryButtonBackgroundColor(states, Theme.of(context).primaryColor, context)),
          elevation: WidgetStateProperty.all(0),
          foregroundColor: WidgetStateProperty.resolveWith((states) =>
              getPrimaryButtonForegroundColor(
                  states, Theme.of(context).colorScheme.onPrimary, context)),
        );
  }

  static Color getPrimaryButtonBackgroundColor(
    Set<WidgetState> states,
    Color primary,
    BuildContext context,
  ) {
    if (states.contains(WidgetState.disabled)) {
      return Theme.of(context).colorScheme.tertiary;
    }
    return primary;
  }

  static Color getPrimaryButtonForegroundColor(
    Set<WidgetState> states,
    Color onPrimary,
    BuildContext context,
  ) {
    if (states.contains(WidgetState.disabled)) {
      return Theme.of(context).colorScheme.secondary;
    }
    return onPrimary;
  }
}
