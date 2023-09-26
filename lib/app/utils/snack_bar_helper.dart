import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarHelper {
  static showErrorSnack({String? message}) {
    final snackBar = SnackBar(
      backgroundColor: Colors.orange,
      content: Text(message ?? 'Something wrong'),
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'OK',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
}
