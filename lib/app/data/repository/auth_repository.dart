import 'package:boiler_plate_getx/app/data/local/auth_local_data_source.dart';
import 'package:get/get.dart';

abstract class AuthRepository {
  void saveToken(String token);
  Future<String?> getToken();
  Future<void> clearToken();
}

class AuthRepositoryImpl implements AuthRepository {
  final _authLocalDataSource = Get.find<AuthLocalDataSource>();

  @override
  void saveToken(String token) {
    return _authLocalDataSource.saveToken(token);
  }

  @override
  Future<String?> getToken() {
    return _authLocalDataSource.getToken();
  }

  @override
  Future<void> clearToken() {
    return _authLocalDataSource.clearToken();
  }
}
