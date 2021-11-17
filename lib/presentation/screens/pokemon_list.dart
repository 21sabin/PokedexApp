import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pokedexapp/data_layer/model/pokemon.dart';
import 'package:http/http.dart' as http;
import '../widgets/pokemon_utils.dart';
import '../../business_logic/routes/route_constant.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  List<PokemonModel> _pokemonList = [];

  Future<void> _getPokemonData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://gist.githubusercontent.com/lighttt/20e03ef249cc9b3ab5496b777c6f066f/raw/b27d2dce021d3b1f906f47bdbf574ffba62c1ded/pokeapi.json'));
      List<dynamic> responseList = jsonDecode(response.body);
      _pokemonList = List<PokemonModel>.from(
        responseList.map(
          (pokemon) {
            return PokemonModel.fromJson(pokemon);
          },
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'PokeDex',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        future: _getPokemonData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          print(snapshot);
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 12,
                  ),
                  itemCount: 50,
                  itemBuilder: (contex, index) {
                    final pokemon = _pokemonList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(pokemonDetailRout);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 2,
                        color: PokemonUtils.getColor(pokemon),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(pokemon.name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Text(pokemon.id,
                                              style: TextStyle(
                                                  color: Colors.black12)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                      child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: pokemon.types
                                                .map((type) => Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10,
                                                              vertical: 4),
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 4),
                                                      decoration: BoxDecoration(
                                                        color: PokemonUtils
                                                            .getColor(pokemon),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      child: Text(type,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                    ))
                                                .toList()),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                            child: Image.network(
                                                pokemon.imageUrl)),
                                      )
                                    ],
                                  )))
                            ],
                          ),
                        ),
                      ),
                    );
                  });
        },
      ),
    );
  }
}
