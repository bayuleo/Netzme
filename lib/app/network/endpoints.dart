class Endpoints {
  late PokemonEndpoint pokemon;

  Endpoints() {
    pokemon = PokemonEndpoint();
  }
}

class PokemonEndpoint {
  final String listPokemon;

  PokemonEndpoint({
    this.listPokemon = '/pokemon',
  });
}
