import 'package:boiler_plate_getx/app/data/local/auth_local_data_source.dart';
import 'package:get/get.dart';

class LocalSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(),
      fenix: true,
    );
  }
}
