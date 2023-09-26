import 'package:boiler_plate_getx/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function() onClick;
  final bool isFullWidth;
  final double? rounded;
  final MaterialColor bgColor;
  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClick,
    this.rounded,
    this.isFullWidth = true,
    this.bgColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isFullWidth ? double.infinity : null,
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(rounded ?? 12),
        boxShadow: const [
          BoxShadow(
            color: shadowColor,
            blurRadius: 8,
            spreadRadius: 1,
            offset: Offset(4, 8), // Shadow position
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onClick,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            return bgColor;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(rounded ?? 12.0),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
