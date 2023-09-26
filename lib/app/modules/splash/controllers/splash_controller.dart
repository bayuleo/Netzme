import 'dart:async';

import 'package:boiler_plate_getx/app/data/repository/auth_repository.dart';
import 'package:boiler_plate_getx/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final _authRepository = Get.find<AuthRepository>();

  @override
  void onReady() async {
    var auth = await _authRepository.getAuth();
    Timer(const Duration(seconds: 3), () {
      if (auth != null) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.LOGIN);
      }
    });
    super.onReady();
  }
}
