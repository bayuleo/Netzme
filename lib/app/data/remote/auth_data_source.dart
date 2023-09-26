import 'dart:async';

import 'package:boiler_plate_getx/app/data/model/response_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/response_auth_data.dart';

abstract class AuthDataSource {
  Future<ResponseAuth> login({
    required String email,
    required String password,
  });
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
}
