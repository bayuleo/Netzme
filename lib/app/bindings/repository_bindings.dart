import 'package:boiler_plate_getx/app/data/repository/auth_repository.dart';
import 'package:boiler_plate_getx/app/data/repository/to_do_repository.dart';
import 'package:get/get.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut<ToDoRepository>(
      () => ToDoRepositoryImpl(),
      fenix: true,
    );
  }
}
