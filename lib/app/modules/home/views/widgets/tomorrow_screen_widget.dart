import 'package:boiler_plate_getx/app/modules/home/controllers/home_controller.dart';
import 'package:boiler_plate_getx/app/modules/home/views/widgets/item_to_do_list_widget.dart';
import 'package:boiler_plate_getx/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TomorrowScreenWidget extends StatelessWidget {
  const TomorrowScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
                    'Tomorrow`s Tasks',
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
                    'Here you can see your task for tomorrow',
                    style: TextStyle(
                      color: secondaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    '${controller.listDataTomorrow.length} Tasks',
                    style: const TextStyle(
                      fontSize: 18,
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.listDataTomorrow.length,
                shrinkWrap: true,
                clipBehavior: Clip.none,
                itemBuilder: (context, index) {
                  var data = controller.listDataTomorrow[index];
                  return InkWell(
                    onTap: () {
                      controller.openDetailScreen(
                        data,
                      );
                    },
                    child: ItemToDoListWidget(
                      title: data.title,
                      status: data.complete,
                      showLeftButton: true,
                      onClickLeft: () => controller.moveToToday(data),
                    ),
                  ); // here is your wordItem ready to be used
                },
              ),
            )
          ],
        ),
      );
    });
  }
}
