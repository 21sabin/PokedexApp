enum PokemonEventType { fetchPokemonDetail }

class PokemonEvents {
  var payload;
  PokemonEventType type;
  PokemonEvents({this.type, this.payload});
}
