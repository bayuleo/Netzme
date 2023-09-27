import 'package:boiler_plate_getx/app/utils/theme.dart';
import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Widget? rightIcon;
  final Color? hintColor;
  final Widget? leftWidget;
  final Function? onTapRightIcon;
  final VoidCallback? onTap;
  final EdgeInsets? margin;
  final EdgeInsets? contentPadding;
  final int? maxLength;
  final int minLines;
  final int? maxLines;
  final bool enabled;
  final bool obsecure;
  final bool readOnly;
  final Function? validator;
  final Function? onChangedText;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Key? rightIconKey;
  final bool changeBorderColorOnFocus;
  final Color? backgroundColor;
  final List<TextInputFormatter>? inputFormatter;
  final AutovalidateMode? autovalidateMode;
  final Function? onFieldSubmitted;
  final double? radius;
  final bool hideTitle;
  final bool showTooltip;
  final String? textTooltip;

  const TextFieldWidget({
    Key? key,
    this.label,
    this.hint,
    this.initialValue,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.rightIcon,
    this.leftWidget,
    this.onTapRightIcon,
    this.onTap,
    this.margin,
    this.contentPadding,
    this.maxLength,
    this.minLines = 1,
    this.maxLines = 1,
    this.enabled = true,
    this.obsecure = false,
    this.readOnly = false,
    this.validator,
    this.onChangedText,
    this.textInputAction,
    this.hintColor,
    this.focusNode,
    this.rightIconKey,
    this.changeBorderColorOnFocus = true,
    this.backgroundColor,
    this.inputFormatter,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.onFieldSubmitted,
    this.radius,
    this.hideTitle = false,
    this.showTooltip = false,
    this.textTooltip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // const Color defaultBorderColor = Color(0xff2D2D2D);
    return Container(
      margin: margin,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!hideTitle)
            SizedBox(
              child: label != null && label!.isNotEmpty
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          label ?? '',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    )
                  : null,
            ),
          if (!hideTitle)
            const SizedBox(
              height: 12,
            ),
          TextFormField(
            controller: controller,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: keyboardType,
            obscureText: obsecure,
            focusNode: focusNode,
            readOnly: readOnly,
            minLines: minLines,
            maxLines: maxLines,
            autovalidateMode: autovalidateMode,
            enabled: enabled,
            initialValue: initialValue,
            validator: (value) => validator?.call(value),
            onChanged: (value) => onChangedText?.call(value),
            onTap: onTap,
            textInputAction: textInputAction,
            onFieldSubmitted: (value) => onFieldSubmitted?.call(value),
            style: TextStyle(
              color: enabled ? primaryColor : Colors.grey,
              fontSize: 14,
            ),
            inputFormatters: inputFormatter,
            // ? Need hidden counterText when setting maxLength
            maxLength: maxLength,
            decoration: InputDecoration(
              counterText: '',
              isDense: true,
              filled: true,
              fillColor: backgroundColor ?? Colors.white,
              contentPadding: contentPadding,
              hintText: hint ?? label,
              suffixIcon: _rightIcon(),
              suffixIconColor: const Color(0x99000000),
              prefixIcon: leftWidget,
              hintStyle: TextStyle(
                fontSize: 12.sp,
                color: hintColor ?? shadowColor,
                overflow: TextOverflow.ellipsis,
              ),
              errorMaxLines: 10,
              border: DecoratedInputBorder(
                child: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? 12),
                  borderSide: BorderSide.none,
                ),
                shadow: const [
                  BoxShadow(
                    color: shadowColor,
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: Offset(4, 8), // Shadow position
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget? _rightIcon() {
    if (rightIcon != null) {
      return InkWell(
        key: rightIconKey,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: rightIcon!,
        ),
        onTap: () => onTapRightIcon?.call(),
      );
    }
    return null;
  }
}
