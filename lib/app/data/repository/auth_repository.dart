import 'package:boiler_plate_getx/app/data/local/auth_local_data_source.dart';
import 'package:boiler_plate_getx/app/data/model/response_auth.dart';
import 'package:boiler_plate_getx/app/data/model/response_auth_data.dart';
import 'package:boiler_plate_getx/app/data/remote/auth_data_source.dart';
import 'package:get/get.dart';

abstract class AuthRepository {
  void saveAuth(ResponseAuthData authData);
  Future<ResponseAuthData?> getAuth();
  Future<void> clearAuth();
  Future<ResponseAuth> login({
    required String email,
    required String password,
  });
}

class AuthRepositoryImpl implements AuthRepository {
  final _authLocalDataSource = Get.find<AuthLocalDataSource>();
  final _authRemoteDataSource = Get.find<AuthDataSource>();

  @override
  void saveAuth(ResponseAuthData authData) {
    return _authLocalDataSource.saveAuth(authData);
  }

  @override
  Future<ResponseAuthData?> getAuth() {
    return _authLocalDataSource.getAuth();
  }

  @override
  Future<void> clearAuth() {
    return _authLocalDataSource.clearAuth();
  }

  @override
  Future<ResponseAuth> login(
      {required String email, required String password}) {
    return _authRemoteDataSource.login(email: email, password: password);
  }
}
