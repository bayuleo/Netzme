import 'package:boiler_plate_getx/app/modules/home/controllers/home_controller.dart';
import 'package:boiler_plate_getx/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DraweWidget extends StatelessWidget {
  final Function() onClickLogout;
  const DraweWidget({
    super.key,
    required this.onClickLogout,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r),
                  // Radius.circular(16.r),
                ),
                color: primaryColor,
                boxShadow: const [
                  BoxShadow(
                    color: shadowColor,
                    blurRadius: 12,
                    spreadRadius: 0,
                    offset: Offset(4, 8), // Shadow position
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    controller.authData?.name ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    controller.authData?.email ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: onClickLogout,
              child: ListTile(
                horizontalTitleGap: 1,
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: const Icon(
                  Icons.exit_to_app,
                  color: primaryColor,
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
