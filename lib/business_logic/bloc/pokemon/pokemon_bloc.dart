import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedexapp/data_layer/model/pokemonDetail.dart';
import './pokemon_event.dart';
import './pokemon_state.dart';
import '../resources/repository.dart';

class PokemonBloc extends Bloc<PokemonEvents, PokemonState> {
  final _repository = Repository();

  PokemonBloc() : super(PokemonInitState());
  @override
  Stream<PokemonState> mapEventToState(PokemonEvents event) async* {
    switch (event.type) {
      case PokemonEventType.fetchPokemonDetail:
        yield PokemonLoading();
        print('bloc called');
        PokemonDetail pokemonDetail =
            await _repository.getPokemonDetailByName(event.payload);
        print('pokemonDetail $pokemonDetail');
        yield PokemonLoaded(pokemonDetail: pokemonDetail);
    }
  }
}
