import 'package:boiler_plate_getx/app/modules/home/controllers/home_controller.dart';
import 'package:boiler_plate_getx/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemToDoListWidget extends StatelessWidget {
  final String? title;
  final bool status;
  final Function()? onClickRight;
  final Function()? onClickLeft;
  final Function(bool?)? onClickCheckbox;
  final Function()? onClickTitle;
  final bool showLeftButton;
  final bool showRightButton;
  final bool showCheckBox;
  const ItemToDoListWidget({
    this.title,
    this.status = false,
    this.onClickRight,
    this.onClickLeft,
    this.onClickCheckbox,
    this.onClickTitle,
    this.showLeftButton = false,
    this.showRightButton = false,
    this.showCheckBox = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        margin: EdgeInsets.only(bottom: 20.h),
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16.r),
          ),
          color: status ? shadowColor : Colors.white,
          boxShadow: const [
            BoxShadow(
              color: shadowColor,
              blurRadius: 12,
              spreadRadius: 0,
              offset: Offset(4, 8), // Shadow position
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (showLeftButton)
              InkWell(
                onTap: onClickLeft,
                child: const Icon(Icons.chevron_left),
              ),
            if (showLeftButton)
              SizedBox(
                width: 12.w,
              ),
            Expanded(
              child: Text(
                title ?? '',
                style: TextStyle(
                  color: status ? secondaryColor : primaryColor,
                  fontWeight: status ? FontWeight.w400 : FontWeight.w600,
                  decoration: status ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
            if (showCheckBox)
              Checkbox(
                checkColor: Colors.white,
                activeColor: secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                value: status,
                onChanged: onClickCheckbox,
              ),
            if (showRightButton)
              InkWell(
                onTap: onClickRight,
                child: const Icon(Icons.chevron_right_rounded),
              ),
          ],
        ),
      );
    });
  }
}
