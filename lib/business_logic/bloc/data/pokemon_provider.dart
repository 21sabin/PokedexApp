import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../../../data_layer/model/pokemonDetail.dart';

class PokemonProvider {
  Client client = Client();
  Future<PokemonDetail> fetchPokemonByName(String name) async {
    try {
      print('111');
      print('https://pokeapi.co/api/v2/pokemon/$name');
      final response = await client
          .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'));
      print(response.body);
      PokemonDetail pokemonDetail =
          PokemonDetail.fromJson(jsonDecode(response.body));
      print('PokemonProvider detail $pokemonDetail');
      return pokemonDetail;
    } catch (error) {
      print('Error fetching pokemon by name $error');
    }
  }
}
// https://pokeapi.co/api/v2/pokemon/ditto
