import 'package:flutter/material.dart';
import 'package:pokedexapp/presentation/screens/pokemonDetail.dart';
import '../../presentation/screens/index.dart';
import './route_constant.dart';

var mainRoutes = {
  pokemonRoute: (ctx) => _renderScreen(PokemonList()),
  pokemonDetailRout: (ctx) => _renderScreen(PokemonDetail())
};

Widget _renderScreen(Widget child) {
  return Scaffold(
    body: SafeArea(
      child: child,
    ),
  );
}
