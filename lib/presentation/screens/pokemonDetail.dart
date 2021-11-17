import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedexapp/business_logic/bloc/pokemon/pokemon_state.dart';
import '../../business_logic/bloc/pokemon/pokemon_event.dart';
import '../../business_logic/bloc/pokemon/pokemon_bloc.dart';

class PokemonDetail extends StatefulWidget {
  const PokemonDetail({Key key}) : super(key: key);

  @override
  _PokemonDetailState createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PokemonBloc>().add(
          PokemonEvents(
              type: PokemonEventType.fetchPokemonDetail, payload: 'ditto'),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
      if (state is PokemonLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is PokemonLoaded) {
        return Container(child: Text('Detail page'));
      } else if (state is PokemonLoadError) {
        return Text('Somethis went worong');
      }
      return Text('');
    });
  }
}
