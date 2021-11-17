import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedexapp/business_logic/bloc/pokemon/pokemon_bloc.dart';
import './business_logic/routes/main_routes.dart';
import './business_logic/routes/route_constant.dart';

void main() {
  runApp(const PokemonApp());
}

class PokemonApp extends StatelessWidget {
  const PokemonApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => PokemonBloc())],
        child: MaterialApp(
          theme: ThemeData(),
          routes: mainRoutes,
          initialRoute: pokemonRoute,
        ));
  }
}

// ThemeData(primaryColor: Colors.red, accentColor: Colors.green
// //swatch affect overal widget color
// //accent affects button color
// //primaryColor affects appbar color
// ),
