import 'package:boiler_plate_getx/app/data/remote/pokemon_data_source.dart';
import 'package:get/get.dart';

import '../model/index.dart';

abstract class PokemonRepository {
  Future<ResponsePokemon> getPokemon();
}

class PokemonRepositoryImpl implements PokemonRepository {
  final _pokemonDataSource = Get.find<PokemonDataSource>();

  @override
  Future<ResponsePokemon> getPokemon() async {
    return await _pokemonDataSource.getPokemon();
  }
}
