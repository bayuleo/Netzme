import 'package:boiler_plate_getx/app/data/repository/auth_repository.dart';
import 'package:boiler_plate_getx/app/routes/app_pages.dart';
import 'package:boiler_plate_getx/app/utils/snack_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final loginKey = GlobalKey<FormState>();
  final _authRepository = Get.find<AuthRepository>();

  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  bool isShowPassword = true;

  @override
  void onInit() async {
    // var auth = _authRepository.getAuth();
    // if (auth != null) {
    //   Get.offAllNamed(Routes.HOME);
    // }
    super.onInit();
  }

  @override
  void onClose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.onClose();
  }

  void onClickRegister() {
    FocusScope.of(Get.context!).unfocus();
    Get.toNamed(Routes.REGISTER);
  }

  void onClickShowPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  void onClickLogin() {
    FocusScope.of(Get.context!).unfocus();
    if (loginKey.currentState!.validate()) {
      _authRepository
          .login(
        email: emailTextEditingController.text.trim(),
        password: passwordTextEditingController.text.trim(),
      )
          .then(
        (res) async {
          if (res.isSuccess) {
            Fluttertoast.showToast(msg: res.message);
            _authRepository.saveAuth(res.data!);
            Get.offAllNamed(Routes.HOME);
          } else {
            SnackBarHelper.showErrorSnack(message: res.message);
          }
        },
      );
    }
  }
}
