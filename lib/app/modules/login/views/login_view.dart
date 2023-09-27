import 'package:boiler_plate_getx/app/core/widgets/text_field_widget.dart';
import 'package:boiler_plate_getx/app/modules/login/controllers/login_controller.dart';
import 'package:boiler_plate_getx/app/utils/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';

class LoginView extends GetView<LoginController> with Validation {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(builder: (controller) {
        return SingleChildScrollView(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Form(
              key: controller.loginKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Icon(
                      CupertinoIcons.info,
                      size: 160,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    TextFieldWidget(
                      validator: valueRequired,
                      controller: controller.emailTextEditingController,
                      label: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFieldWidget(
                      validator: valueRequired,
                      controller: controller.passwordTextEditingController,
                      label: 'Password',
                      keyboardType: TextInputType.text,
                      obsecure: controller.isShowPassword,
                      rightIcon: controller.isShowPassword
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      onTapRightIcon: controller.onClickShowPassword,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () {
                        controller.onClickLogin();
                      },
                      child: controller.isLoading
                          ? const CircularProgressIndicator()
                          : const Text('Login'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Flexible(child: Divider()),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'OR',
                          style: TextStyle(color: shadowColor),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Flexible(child: Divider()),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () {
                        controller.onClickRegister();
                      },
                      // child: const Text('Register'),
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
