import 'dart:async';

import 'package:boiler_plate_getx/app/data/model/index.dart';
import 'package:boiler_plate_getx/app/data/model/param_register.dart';
import 'package:boiler_plate_getx/app/data/model/response_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/response_auth_data.dart';

abstract class AuthDataSource {
  Future<ResponseAuth> login({
    required String email,
    required String password,
  });

  Future<ResponseGeneral> register(ParamRegister param);
}

class AuthDataSourceImpl implements AuthDataSource {
  CollectionReference collection =
      FirebaseFirestore.instance.collection('users');

  @override
  Future<ResponseAuth> login(
      {required String email, required String password}) async {
    try {
      var response = await collection
          .where("email", isEqualTo: email)
          .where('password', isEqualTo: password)
          .get()
          .timeout(
            const Duration(
              seconds: 5,
            ),
          );
      if (response.docs.isNotEmpty) {
        return ResponseAuth(
            isSuccess: true,
            message: 'Success',
            data: ResponseAuthData.fromJson(
                response.docs.first.data() as Map<String, dynamic>));
      } else {
        return const ResponseAuth(isSuccess: false, message: 'User not found');
      }
    } on FirebaseException catch (e) {
      return ResponseAuth(isSuccess: false, message: e.message ?? 'Unknown');
    } on TimeoutException {
      return const ResponseAuth(
          isSuccess: false, message: 'Connection time out');
    }
  }

  @override
  Future<ResponseGeneral> register(ParamRegister param) async {
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
}
