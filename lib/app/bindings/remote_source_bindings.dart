import 'package:boiler_plate_getx/app/data/remote/pokemon_data_source.dart';
import 'package:get/get.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PokemonDataSource>(
      () => PokemonDataSourceImpl(),
      fenix: true,
    );
  }
}
