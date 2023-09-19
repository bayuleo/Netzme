import 'package:boiler_plate_getx/app/data/repository/auth_repository.dart';
import 'package:boiler_plate_getx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final loginKey = GlobalKey<FormState>();
  final _localStorage = Get.find<AuthRepository>();

  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  @override
  void onInit() async {
    var token = await _localStorage.getToken();
    if (token != '' && token != null) {
      Get.offAllNamed(Routes.HOME);
    }
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.onClose();
  }

  void onClickLogin() {
    FocusScope.of(Get.context!).unfocus();
    if (loginKey.currentState!.validate()) {
      saveDataToLocal();
      Get.offAllNamed(Routes.HOME);
    }
  }

  void saveDataToLocal() {
    _localStorage.saveToken(
      emailTextEditingController.text.trim(),
    );
  }
}
