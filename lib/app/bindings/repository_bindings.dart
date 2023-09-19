import 'package:boiler_plate_getx/app/data/repository/auth_repository.dart';
import 'package:boiler_plate_getx/app/data/repository/pokemon_repository.dart';
import 'package:get/get.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PokemonRepository>(
      () => PokemonRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(),
      fenix: true,
    );
  }
}
