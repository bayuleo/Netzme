import 'package:boiler_plate_getx/app/bindings/local_source_bindings.dart';
import 'package:boiler_plate_getx/app/bindings/remote_source_bindings.dart';
import 'package:boiler_plate_getx/app/bindings/repository_bindings.dart';
import 'package:boiler_plate_getx/app/network/dio_config.dart';
import 'package:boiler_plate_getx/app/network/endpoints.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DependencyInjection {
  static Future<void> init() async {
    await Hive.initFlutter();
    LocalSourceBindings().dependencies();
    RemoteSourceBindings().dependencies();
    RepositoryBindings().dependencies();
    Get.lazyPut<DioConfigure>(() => DioConfigure(), fenix: true);
    Get.lazyPut<Endpoints>(() => Endpoints(), fenix: true);
  }
}
