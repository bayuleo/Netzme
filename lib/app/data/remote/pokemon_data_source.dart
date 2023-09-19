import 'package:boiler_plate_getx/app/network/dio_config.dart';
import 'package:boiler_plate_getx/app/network/endpoints.dart';
import 'package:get/get.dart';

import '../model/index.dart';

abstract class PokemonDataSource {
  Future<ResponsePokemon> getPokemon();
}

class PokemonDataSourceImpl implements PokemonDataSource {
  final dioConfigure = Get.find<DioConfigure>();
  final endpoints = Get.find<Endpoints>();

  @override
  Future<ResponsePokemon> getPokemon() async {
    var response = await dioConfigure.dio.get(endpoints.pokemon.listPokemon);
    return ResponsePokemon.fromJson(response.data);
  }
}
