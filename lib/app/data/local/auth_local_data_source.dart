import 'package:boiler_plate_getx/app/utils/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

abstract class AuthLocalDataSource {
  void saveToken(String token);
  Future<String?> getToken();
  Future<void> clearToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  // var storage = Hive.box('auth');
  final key = "Token";
  @override
  void saveToken(String token) async {
    var box = await Hive.openBox(hiveBox);
    try {
      box.put(key, token);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<String?> getToken() async {
    var box = await Hive.openBox(hiveBox);
    return box.get(key);
  }

  @override
  Future<void> clearToken() async {
    var box = await Hive.openBox(hiveBox);
    box.clear();
  }
}
