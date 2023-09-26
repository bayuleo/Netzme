import 'package:boiler_plate_getx/app/core/widgets/button_widget.dart';
import 'package:boiler_plate_getx/app/core/widgets/text_field_widget.dart';
import 'package:boiler_plate_getx/app/utils/theme.dart';
import 'package:boiler_plate_getx/app/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> with Validation {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: GetBuilder<RegisterController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: controller.registerKey,
              child: Column(
                children: [
                  TextFieldWidget(
                    label: 'Name',
                    controller: controller.nameController,
                    validator: valueRequired,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextFieldWidget(
                    label: 'Email',
                    controller: controller.emailController,
                    validator: emailRequired,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextFieldWidget(
                    label: 'Password',
                    controller: controller.passController,
                    validator: passwordRequired,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextFieldWidget(
                    label: 'Reconfirm Password',
                    controller: controller.rePassController,
                    validator: (value) => repasswordRequired(
                      value,
                      controller.passController.text.trim(),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ButtonWidget(
                    text: 'Register',
                    onClick: controller.onClickRegister,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
