import 'package:boiler_plate_getx/app/data/model/index.dart';
import 'package:boiler_plate_getx/app/data/repository/to_do_repository.dart';
import 'package:boiler_plate_getx/app/utils/snack_bar_helper.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

enum Mode { add, update }

class DetailController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final _repository = Get.find<ToDoRepository>();

  var titleController = TextEditingController();
  var descController = TextEditingController();

  Mode formMode = Mode.add;
  ResponseToDo? data;
  String? selectedDate;

  @override
  void onReady() {
    data = Get.arguments;
    if (data != null) {
      selectedDate = data?.time;
      formMode = Mode.update;
      initFormValue();
    }
    update();
    super.onReady();
  }

  void initFormValue() {
    titleController.text = data?.title ?? '';
    descController.text = data?.desc ?? '';
  }

  @override
  void onClose() {
    titleController.dispose();
    descController.dispose();
    super.onClose();
  }

  void onChangeDropdown(String value) {
    selectedDate = value;
  }

  void onClickButtonConfirm() {
    if (formKey.currentState!.validate()) {
      if (formMode == Mode.add) {
        addNewData();
      } else {
        updateData();
      }
    }
  }

  Future<void> onClickButtonRemove() async {
    if (await confirm(
      Get.context!,
      title: const Text('Confirm'),
      content: const Text('Would you like to remove?'),
      textOK: const Text('Yes'),
      textCancel: const Text('No'),
    )) {
      _repository.deleteData(data!).then((res) {
        if (res.isSuccess) {
          Fluttertoast.showToast(msg: res.message);
          Get.back();
        } else {
          SnackBarHelper.showErrorSnack(message: res.message);
        }
      });
    }
  }

  void addNewData() {
    _repository
        .addData(
      ParamToDo(
        title: titleController.text.trim(),
        time: selectedDate ?? '',
        desc: descController.text.trim(),
        complete: false,
      ),
    )
        .then(
      (res) {
        if (res.isSuccess) {
          Fluttertoast.showToast(msg: res.message);
          Get.back();
        } else {
          SnackBarHelper.showErrorSnack(message: res.message);
        }
      },
    );
  }

  void updateData() {
    _repository
        .updateData(
      ResponseToDo(
        id: data!.id,
        title: titleController.text.trim(),
        time: selectedDate ?? '',
        desc: descController.text.trim(),
        complete: data!.complete,
      ),
    )
        .then(
      (res) {
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
