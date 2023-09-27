import 'package:boiler_plate_getx/app/modules/home/views/widgets/drawer_widget.dart';
import 'package:boiler_plate_getx/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/widgets/button_widget.dart';
import '../controllers/home_controller.dart';
import 'widgets/today_screen_widget.dart';
import 'widgets/tomorrow_screen_widget.dart';
import 'widgets/yesterday_screen_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DraweWidget(
        onClickLogout: () {
          controller.onClickLogout();
        },
      ),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 20.h,
            ),
            child: GetBuilder<HomeController>(builder: (controller) {
              return IndexedStack(
                index: controller.selectedScreen,
                children: const [
                  YesterdayScreenWidget(),
                  TodayScreenWidget(),
                  TomorrowScreenWidget(),
                ],
              );
            }),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: GetBuilder<HomeController>(builder: (controller) {
                return ButtonWidget(
                  text: 'Add Task',
                  rounded: 100,
                  isFullWidth: false,
                  onClick: () {
                    controller.openDetailScreen();
                  },
                );
              }),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<HomeController>(builder: (controller) {
        return BottomNavigationBar(
          currentIndex: controller.selectedScreen,
          onTap: controller.onTapBottomMenu,
          selectedItemColor: primaryColor,
          items: const [
            BottomNavigationBarItem(
              label: 'Yesterday',
              icon: Icon(
                Icons.history,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Today',
              icon: Icon(
                Icons.calendar_today,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Tomorrow',
              icon: Icon(
                Icons.plus_one,
              ),
            ),
          ],
        );
      }),
    );
  }
}
