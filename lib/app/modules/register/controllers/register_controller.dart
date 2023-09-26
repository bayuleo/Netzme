import 'package:boiler_plate_getx/app/data/model/param_register.dart';
import 'package:boiler_plate_getx/app/data/repository/auth_repository.dart';
import 'package:boiler_plate_getx/app/utils/snack_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final registerKey = GlobalKey<FormState>();
  final _authRepository = Get.find<AuthRepository>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var rePassController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    rePassController.dispose();
    super.onClose();
  }

  void onClickRegister() {
    if (registerKey.currentState!.validate()) {
      _authRepository
          .register(
        ParamRegister(
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          password: passController.text.trim(),
        ),
      )
          .then(
        (res) async {
          if (res.isSuccess) {
            Fluttertoast.showToast(msg: res.message);
            Get.back();
          } else {
            SnackBarHelper.showErrorSnack(message: res.message);
          }
        },
      );
    }
  }
}
