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
      body: SingleChildScrollView(
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
                  TextFormField(
                    validator: emailRequired,
                    controller: controller.emailTextEditingController,
                    decoration: const InputDecoration(
                      label: Text('Email'),
                      hintText: 'Masukan email anda',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: passwordRequired,
                    controller: controller.passwordTextEditingController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      label: Text('Password'),
                      hintText: 'Masukan email anda',
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {
                      controller.onClickLogin();
                    },
                    child: const Text('Login'),
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
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
