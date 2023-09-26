import 'package:boiler_plate_getx/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropdownFieldWidget extends StatelessWidget {
  final String? label;
  final String? hint;
  final Color? hintColor;
  final EdgeInsets? margin;
  final EdgeInsets? contentPadding;
  final bool enabled;
  final Function? validator;
  final Function? onChanged;
  final FocusNode? focusNode;
  final Key? rightIconKey;
  final Color? backgroundColor;
  final List<DropdownMenuItem>? items;
  final double? radius;
  final bool hideTitle;
  final bool showTooltip;
  final String? textTooltip;
  final VoidCallback? onTap;
  final dynamic? value;

  const DropdownFieldWidget(
      {Key? key,
      this.label,
      this.hint,
      this.onTap,
      this.margin,
      this.contentPadding,
      this.enabled = true,
      this.validator,
      this.onChanged,
      this.hintColor,
      this.focusNode,
      this.rightIconKey,
      this.backgroundColor,
      this.radius,
      this.hideTitle = false,
      this.showTooltip = false,
      this.textTooltip,
      this.items,
      this.value})
      : super(key: key);

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
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: Offset(4, 8), // Shadow position
                ),
              ],
            ),
            child: DropdownButtonFormField(
              focusNode: focusNode,
              validator: (value) => validator?.call(value),
              onChanged: (value) => onChanged?.call(value),
              value: value,
              onTap: onTap,
              style: TextStyle(
                color: enabled ? primaryColor : Colors.grey,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                counterText: '',
                isDense: true,
                filled: true,
                fillColor: backgroundColor ?? Colors.white,
                contentPadding: contentPadding,
                hintText: hint ?? label,
                suffixIconColor: const Color(0x99000000),
                hintStyle: TextStyle(
                  fontSize: 12.sp,
                  color: hintColor ?? shadowColor,
                  overflow: TextOverflow.ellipsis,
                ),
                errorMaxLines: 10,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? 12),
                  borderSide: BorderSide.none,
                ),
              ),
              items: items,
            ),
          ),
        ],
      ),
    );
  }
}
