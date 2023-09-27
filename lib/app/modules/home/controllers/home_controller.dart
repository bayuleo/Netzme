import 'package:boiler_plate_getx/app/data/model/index.dart';
import 'package:boiler_plate_getx/app/data/model/response_auth_data.dart';
import 'package:boiler_plate_getx/app/data/repository/auth_repository.dart';
import 'package:boiler_plate_getx/app/data/repository/to_do_repository.dart';
import 'package:boiler_plate_getx/app/routes/app_pages.dart';
import 'package:boiler_plate_getx/app/utils/date_helper.dart';
import 'package:boiler_plate_getx/app/utils/snack_bar_helper.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _localStorage = Get.find<AuthRepository>();
  final _repository = Get.find<ToDoRepository>();
  List<ResponseToDo> listData = [];
  List<ResponseToDo> listDataYesterday = [];
  List<ResponseToDo> listDataToday = [];
  List<ResponseToDo> listDataTomorrow = [];

  int selectedScreen = 1;
  bool checkValue = false;
  bool isInitLoading = true;

  ResponseAuthData? authData;

  @override
  void onReady() async {
    await getAuthData();
    await getListDataToDo();
    isInitLoading = false;
    update();
    super.onReady();
  }

  void onTapBottomMenu(int index) {
    selectedScreen = index;
    update();
  }

  void onTapCheckBox(bool? value) {
    checkValue = value ?? false;
    update();
  }

  void openDetailScreen([ResponseToDo? data]) async {
    await Get.toNamed(Routes.DETAIL, arguments: data);
    getListDataToDo();
  }

  Future<void> getListDataToDo() async {
    ResponseListToDo res = await _repository.getData(authData!.email);
    if (res.isSuccess) {
      listData.clear();
      listDataToday.clear();
      listDataYesterday.clear();
      listDataTomorrow.clear();
      listData.addAll(res.data ?? []);

      for (var e in listData) {
        if (e.time == DateHelper.getToday()) {
          listDataToday.add(e);
        } else if (e.time == DateHelper.getTomorrow()) {
          listDataTomorrow.add(e);
        } else if (e.time == DateHelper.getYesterday()) {
          listDataYesterday.add(e);
        }
      }
    } else {
      SnackBarHelper.showErrorSnack(message: res.message);
    }
    update();
  }

  void moveToToday(ResponseToDo data) {
    var newData = ResponseToDo(
      id: data.id,
      title: data.title,
      time: DateHelper.getToday(),
      desc: data.desc,
      complete: false,
      email: data.email,
    );
    updateData(newData);
  }

  void moveToTomorrow(ResponseToDo data) {
    var newData = ResponseToDo(
      id: data.id,
      title: data.title,
      time: DateHelper.getTomorrow(),
      desc: data.desc,
      complete: false,
      email: data.email,
    );
    updateData(newData);
  }

  void updateData(ResponseToDo data, {bool? isComplete}) {
    _repository
        .updateData(
      ResponseToDo(
        id: data.id,
        title: data.title,
        time: data.time,
        desc: data.desc,
        complete: isComplete ?? data.complete,
        email: data.email,
      ),
    )
        .then(
      (res) {
        if (res.isSuccess) {
          Fluttertoast.showToast(msg: res.message);
          getListDataToDo();
        } else {
          SnackBarHelper.showErrorSnack(message: res.message);
        }
      },
    );
  }

  int getSuccessTask(List<ResponseToDo> data) {
    return data.where((e) => e.complete).length;
  }

  void onClickLogout() async {
    if (await confirm(
      Get.context!,
      title: const Text('Confirm'),
      content: const Text('Are you sure want to logout?'),
      textOK: const Text('Yes'),
      textCancel: const Text('No'),
    )) {
      await _localStorage.clearAuth();
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  Future<void> getAuthData() async {
    authData = await _localStorage.getAuth();
    update();
  }
}
