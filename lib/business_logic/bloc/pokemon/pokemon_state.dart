import 'package:equatable/equatable.dart';
import '../../../data_layer/model/pokemonDetail.dart';

abstract class PokemonState extends Equatable {
  @override
  List<Object> get props => [];
}

class PokemonInitState extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonLoaded extends PokemonState {
  final PokemonDetail pokemonDetail;
  PokemonLoaded({this.pokemonDetail});
}

class PokemonLoadError extends PokemonState {
  final error;
  PokemonLoadError({this.error});
}
