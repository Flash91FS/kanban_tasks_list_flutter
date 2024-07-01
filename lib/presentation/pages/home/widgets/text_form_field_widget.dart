import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/config/kanban_config.dart';

class TextFormFieldWidget extends StatelessWidget {
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChange;
  final FormFieldValidator<String>? validate;
  final TextInputType keyboardType;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final Color? focusColorBorder;
  final TextEditingController? controller;
  final bool isEnabled;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? suffixIcon;
  final String? hintText;
  final bool autoValidate;
  final TextStyle? errorStyle;
  final FocusNode? focusNode;
  final String? mandatoryText;
  final bool mandatory;
  final bool isScrollPadding;
  final bool alignHintLabel;
  final bool autoFocus;
  final List<TextInputFormatter>? inputFormatter;
  final String? initialValue;
  final BorderRadius? borderRadius;
  final bool showLabel;
  final OutlineInputBorder? focusedBorder;
  final OutlineInputBorder? disabledBorder;
  final OutlineInputBorder? enabledBorder;
  final OutlineInputBorder? focusedErrorBorder;
  final OutlineInputBorder? errorBorder;

  const TextFormFieldWidget({
    super.key,
    this.color,
    this.alignHintLabel = true,
    this.fontSize,
    this.isScrollPadding = false,
    this.mandatory = false,
    this.autoFocus = false,
    this.mandatoryText,
    this.maxLines,
    this.suffix,
    this.onTap,
    this.onChange,
    this.validate,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.focusColorBorder,
    this.controller,
    this.isEnabled = true,
    this.prefixIcon,
    this.prefix,
    this.hintText,
    this.inputFormatter,
    this.autoValidate = true,
    this.focusNode,
    this.errorStyle,
    this.initialValue,
    this.borderRadius,
    this.showLabel = true,
    this.suffixIcon,
    this.focusedBorder,
    this.disabledBorder,
    this.enabledBorder,
    this.focusedErrorBorder,
    this.errorBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextFormField(
        autofocus: autoFocus,
        initialValue: initialValue,
        textInputAction: textInputAction,
        textCapitalization: textCapitalization,
        controller: controller,
        maxLines: maxLines ?? 1,
        onTap: onTap,
        cursorColor: Colors.black,
        focusNode: focusNode,
        scrollPadding:
            isScrollPadding ? EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 100) : EdgeInsets.zero,
        inputFormatters: inputFormatter,
        onChanged: (value) {
          if (onChange != null) {
            onChange!(value);
          }
        },
        autovalidateMode: autoValidate ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
        validator: validate,
        maxLength: maxLength,
        keyboardType: keyboardType,
        enabled: isEnabled,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        style: TextStyle(
          fontSize: fontSize ?? 14,
          color: color ?? (isEnabled ? Colors.black : Colors.black),//borderColor
        ),
        decoration: InputDecoration(
          counterText: '',
          hintText: hintText,
          labelStyle: const TextStyle(fontSize: 12, color: borderColor),
          hintStyle: const TextStyle(fontSize: 12, color: borderColor),
          label: (showLabel)
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if ((hintText ?? '').isNotEmpty)
                      Text(
                        hintText ?? '',
                        style: TextStyle(
                          fontSize: 12,
                          color: isEnabled ? Colors.black : Colors.black, //dividerColor
                        ),
                      ),
                    if (mandatory)
                      Text(
                        mandatoryText ?? '',
                        style: TextStyle(
                          fontSize: 12,
                          color: mandatory
                              ? Colors.red
                              : isEnabled
                                  ? Colors.black
                                  : dividerColor,
                        ),
                      ),
                  ],
                )
              : const SizedBox.shrink(),
          alignLabelWithHint: alignHintLabel,
          filled: true,
          isDense: true,
          fillColor: Colors.white,
          prefixIcon: prefixIcon,
          prefix: prefix,
          suffix: suffix,
          suffixIcon: suffixIcon,
          errorMaxLines: 2,
          errorStyle: errorStyle ?? const TextStyle(fontSize: 10, color: Colors.red, height: 1),
          contentPadding: EdgeInsets.only(left: 14.0, bottom: maxLength == null ? 12.0 : 26.0, top: 12.0, right: 15),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderSide: BorderSide(color: focusColorBorder ?? Colors.black, width: 1),
                borderRadius: borderRadius ?? BorderRadius.circular(10),
              ),
          disabledBorder: disabledBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(color: borderColor, width: 1),
                borderRadius: borderRadius ?? BorderRadius.circular(10),
              ),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(color: borderColor, width: 1),
                borderRadius: borderRadius ?? BorderRadius.circular(10),
              ),
          focusedErrorBorder: focusedErrorBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1.5),
                borderRadius: borderRadius ?? BorderRadius.circular(10),
              ),
          errorBorder: errorBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1),
                borderRadius: borderRadius ?? BorderRadius.circular(10),
              ),
        ),
      ),
    );
  }
}
