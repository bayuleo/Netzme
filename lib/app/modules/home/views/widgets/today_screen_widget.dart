import 'package:boiler_plate_getx/app/modules/home/controllers/home_controller.dart';
import 'package:boiler_plate_getx/app/modules/home/views/widgets/item_to_do_list_widget.dart';
import 'package:boiler_plate_getx/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TodayScreenWidget extends StatelessWidget {
  const TodayScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Skeletonizer(
          enabled: controller.isInitLoading,
          containersColor: bgColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 20.h,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 20.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.r),
                  ),
                  color: Colors.white,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Today`s Tasks',
                      style: TextStyle(
                        fontSize: 20,
                        color: primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Here you can see your progress for today',
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      '${controller.listDataToday.length} Task${controller.listDataToday.length > 1 ? '`s' : ''}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LinearProgressIndicator(
                      color: primaryColor,
                      backgroundColor: shadowColor,
                      value: controller.listDataToday.isNotEmpty
                          ? controller
                                  .getSuccessTask(controller.listDataToday) /
                              controller.listDataToday.length
                          : 1,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.listDataToday.length,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = controller.listDataToday[index];
                    return GestureDetector(
                      onTap: () {
                        controller.openDetailScreen(
                          data,
                        );
                      },
                      child: ItemToDoListWidget(
                        title: data.title,
                        status: data.complete,
                        showCheckBox: true,
                        onClickCheckbox: (val) => controller.updateData(
                          data,
                          isComplete: val,
                        ),
                        // showRightButton: true,
                        // onClickRight: () => controller.moveToTomorrow(data),
                      ),
                    ); // here is your wordItem ready to be used
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
