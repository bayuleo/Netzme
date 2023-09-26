import 'dart:async';

import 'package:boiler_plate_getx/app/data/model/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

abstract class ToDoDataSource {
  Future<ResponseGeneral> addData(ParamToDo param);
  Future<ResponseListToDo> getData();
  Future<ResponseGeneral> updateData(ResponseToDo param);
  Future<ResponseGeneral> deleteData(ResponseToDo param);
}

class ToDoDataSourceImpl implements ToDoDataSource {
  CollectionReference collection =
      FirebaseFirestore.instance.collection('todos');

  @override
  Future<ResponseGeneral> addData(ParamToDo param) async {
    try {
      await collection.add(param.toJson()).timeout(
            const Duration(
              seconds: 5,
            ),
          );
      return const ResponseGeneral(isSuccess: true, message: 'Success');
    } on FirebaseException catch (e) {
      return ResponseGeneral(isSuccess: false, message: e.message ?? 'Unknown');
    } on TimeoutException {
      return const ResponseGeneral(
          isSuccess: false, message: 'Connection time out');
    }
  }

  @override
  Future<ResponseListToDo> getData() async {
    try {
      var responseToday = await collection
          .where("time",
              isEqualTo: DateFormat('dd-MM-yyyy').format(DateTime.now()))
          .get()
          .timeout(
            const Duration(
              seconds: 5,
            ),
          );
      List<ResponseToDo> listDataToday = responseToday.docs
          .map<ResponseToDo>((e) =>
              ResponseToDo.fromJson(e.data() as Map<String, dynamic>, e.id))
          .toList();

      var responseYesterday = await collection
          .where("time",
              isEqualTo: DateFormat('dd-MM-yyyy')
                  .format(DateTime.now().add(const Duration(days: -1))))
          .get()
          .timeout(
            const Duration(
              seconds: 5,
            ),
          );
      List<ResponseToDo> listDataYesterday = responseYesterday.docs
          .map<ResponseToDo>((e) =>
              ResponseToDo.fromJson(e.data() as Map<String, dynamic>, e.id))
          .toList();

      var responseTomorrow = await collection
          .where("time",
              isEqualTo: DateFormat('dd-MM-yyyy')
                  .format(DateTime.now().add(const Duration(days: 1))))
          .get()
          .timeout(
            const Duration(
              seconds: 5,
            ),
          );
      List<ResponseToDo> listDataTomorrow = responseTomorrow.docs
          .map<ResponseToDo>((e) =>
              ResponseToDo.fromJson(e.data() as Map<String, dynamic>, e.id))
          .toList();

      List<ResponseToDo> listData = listDataToday;
      listData.addAll(listDataTomorrow);
      listData.addAll(listDataYesterday);

      return ResponseListToDo(
        isSuccess: true,
        message: 'Success',
        data: listData,
      );
    } on FirebaseException catch (e) {
      return ResponseListToDo(
          isSuccess: false, message: e.message ?? 'Unknown');
    } on TimeoutException {
      return const ResponseListToDo(
          isSuccess: false, message: 'Connection time out');
    }
  }

  @override
  Future<ResponseGeneral> updateData(ResponseToDo param) async {
    try {
      await collection
          .doc(param.id)
          .update(
            ParamToDo(
              title: param.title,
              time: param.time,
              desc: param.desc,
              complete: param.complete,
            ).toJson(),
          )
          .timeout(
            const Duration(
              seconds: 5,
            ),
          );
      return const ResponseGeneral(isSuccess: true, message: 'Success');
    } on FirebaseException catch (e) {
      return ResponseGeneral(isSuccess: false, message: e.message ?? 'Unknown');
    } on TimeoutException {
      return const ResponseGeneral(
          isSuccess: false, message: 'Connection time out');
    }
  }

  @override
  Future<ResponseGeneral> deleteData(ResponseToDo param) async {
    try {
      await collection.doc(param.id).delete().timeout(
            const Duration(
              seconds: 5,
            ),
          );
      return const ResponseGeneral(isSuccess: true, message: 'Success');
    } on FirebaseException catch (e) {
      return ResponseGeneral(isSuccess: false, message: e.message ?? 'Unknown');
    } on TimeoutException {
      return const ResponseGeneral(
          isSuccess: false, message: 'Connection time out');
    }
  }
}
