import 'dart:async';
import 'package:pokedexapp/data_layer/model/pokemonDetail.dart';

import '../data/pokemon_provider.dart';

class Repository {
  final pokemonProvider = PokemonProvider();

  Future<PokemonDetail> getPokemonDetailByName(String name) {
    return pokemonProvider.fetchPokemonByName(name);
  }
}
