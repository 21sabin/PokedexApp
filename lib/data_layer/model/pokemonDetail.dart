class PokemonDetail {
  List<Moves> moves;
  String description;
  int height;
  int weight;
  String gender;
  int id;
  List<String> types;

  PokemonDetail(
      {this.moves,
      this.description,
      this.height,
      this.weight,
      this.gender,
      this.id,
      this.types});

  factory PokemonDetail.fromJson(Map<String, dynamic> json) {
    return PokemonDetail(
        description: 'Description is comming soon',
        height: json['height'],
        weight: json['weight'],
        gender: 'Male',
        id: json['id'],
        types: (json['types'] as List<dynamic>)
            .map((e) => e['type']['name'] as String)
            .toList(),
        moves: (json['stats'] as List<dynamic>)
            .map((e) => Moves.fromJson(e))
            .toList());
  }
}

class Moves {
  int base_stat;
  String name;
  Moves({this.base_stat, this.name});

  factory Moves.fromJson(Map<String, dynamic> json) {
    return Moves(
      base_stat: json['base_stat'],
      name: json['stat']['name'],
    );
  }
}
