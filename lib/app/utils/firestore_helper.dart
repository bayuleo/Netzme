import 'dart:async';

import 'package:boiler_plate_getx/app/data/model/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'snack_bar_helper.dart';

class FirestoreHelper {
  static Future<ResponseGeneral> add(CollectionReference collectionReference,
      Map<String, dynamic> param) async {
    try {
      await collectionReference.add(param).timeout(
            const Duration(
              seconds: 5,
            ),
          );
      return const ResponseGeneral(isSuccess: true, message: 'Success');
    } on FirebaseException catch (e) {
      SnackBarHelper.showErrorSnack(message: e.message);
      return ResponseGeneral(isSuccess: false, message: e.message ?? 'Unknown');
    } on TimeoutException catch (e) {
      SnackBarHelper.showErrorSnack(message: 'Connection time out');
      return const ResponseGeneral(
          isSuccess: false, message: 'Connection time out');
    }
  }

  static Future<ResponseGeneral> get(
      CollectionReference collectionReference) async {
    try {
      var x = await collectionReference
          .where("time", isEqualTo: "today")
          .get()
          .timeout(
            const Duration(
              seconds: 5,
            ),
          );
      var y = x.docs
          .map<ResponseToDo>(
              (e) => ResponseToDo.fromJson(e.data() as Map<String, dynamic>))
          .toList();
      print(y);
      return const ResponseGeneral(
        isSuccess: true,
        message: 'Success',
      );
    } on FirebaseException catch (e) {
      SnackBarHelper.showErrorSnack(message: e.message);
      return ResponseGeneral(isSuccess: false, message: e.message ?? 'Unknown');
    } on TimeoutException catch (e) {
      SnackBarHelper.showErrorSnack(message: 'Connection time out');
      return const ResponseGeneral(
          isSuccess: false, message: 'Connection time out');
    }
  }

  static Future<ResponseGeneral> delete(
      CollectionReference collectionReference, String id) async {
    try {
      await collectionReference.doc(id).delete().timeout(
            const Duration(
              seconds: 5,
            ),
          );
      return const ResponseGeneral(isSuccess: true, message: 'Success');
    } on FirebaseException catch (e) {
      SnackBarHelper.showErrorSnack(message: e.message);
      return ResponseGeneral(isSuccess: false, message: e.message ?? 'Unknown');
    } on TimeoutException catch (e) {
      SnackBarHelper.showErrorSnack(message: 'Connection time out');
      return const ResponseGeneral(
          isSuccess: false, message: 'Connection time out');
    }
  }
}
