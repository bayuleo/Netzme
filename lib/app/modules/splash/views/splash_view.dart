import 'package:boiler_plate_getx/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/me.png'),
            const Text(
              'Task Netzme App',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 32,
                color: primaryColor,
              ),
            ),
          ],
        ),
      );
    });
  }
}
