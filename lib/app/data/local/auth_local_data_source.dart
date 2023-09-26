import 'package:boiler_plate_getx/app/data/model/response_auth_data.dart';
import 'package:boiler_plate_getx/app/utils/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

abstract class AuthLocalDataSource {
  void saveAuth(ResponseAuthData authData);
  Future<ResponseAuthData?> getAuth();
  Future<void> clearAuth();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  // var storage = Hive.box('auth');
  final key = "Auth";
  @override
  void saveAuth(ResponseAuthData authData) async {
    var box = await Hive.openBox(hiveBox);
    try {
      box.put(key, authData.toJson());
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<ResponseAuthData?> getAuth() async {
    var box = await Hive.openBox(hiveBox);
    var x = await box.get(key);
    if (box.isNotEmpty) {
      return ResponseAuthData.fromJson(x);
    }
    return null;
  }

  @override
  Future<void> clearAuth() async {
    var box = await Hive.openBox(hiveBox);
    await box.clear();
  }
}
