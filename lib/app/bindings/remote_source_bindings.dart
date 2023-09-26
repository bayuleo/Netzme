import 'package:boiler_plate_getx/app/data/remote/auth_data_source.dart';
import 'package:boiler_plate_getx/app/data/remote/to_do_data_source.dart';
import 'package:get/get.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ToDoDataSource>(
      () => ToDoDataSourceImpl(),
      fenix: true,
    );
    Get.lazyPut<AuthDataSource>(
      () => AuthDataSourceImpl(),
      fenix: true,
    );
  }
}
