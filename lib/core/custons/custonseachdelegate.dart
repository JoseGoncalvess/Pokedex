// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:pokedexx/model/pokev2model.dart';
import 'package:pokedexx/services/pokemon_services.dart';

import '../widgets/pokemoncard.dart';

class Custonseachdelegate extends SearchDelegate {
  String msg = '';

  final Function() onPressed;
  Custonseachdelegate({
    required this.onPressed,
  });

  static List<Pokemon> pokemons = [];
  static List<String> searchtermrd = [];
  static getpokemondelegate() {
    for (var i = 0; i < 5; i++) {
      int number = Random().nextInt(300);
      PokemonServices()
          .getpokemons('https://pokeapi.co/api/v2/pokemon/$number')
          .then((value) => {
                pokemons.add(value.pokemon),
                searchtermrd.add(value.pokemon.name)
              });
    }
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
            getpokemondelegate();
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Pokemon> matchQuery = [];

    for (var i = 0; i < pokemons.length; i++) {
      for (var poke in searchtermrd) {
        if (poke.toLowerCase() == query.toLowerCase()) {
          if (poke == pokemons[i].name!.toLowerCase()) {
            // log('$poke == ${pokemons[i].name.toLowerCase()}');
            matchQuery.add(pokemons[i]);
            // log(matchQuery.length.toString());
          }
        } else {
          msg = 'Pokemon Não Encontrado';
        }
      }
    }
    return ListView.builder(
        itemCount: matchQuery.isEmpty ? 1 : matchQuery.length,
        itemBuilder: (context, index) => Pokemoncard(
              id: matchQuery[index].id.toString(),
              name: matchQuery[index].name!,
              onPressed: onPressed,
              type: pokemons[index].types!,
            ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Pokemon> matchQuerysug = [];
    bool result2 = true;

    for (var i = 0; i < pokemons.length; i++) {
      for (var poke in searchtermrd) {
        if (poke.toLowerCase().contains(query.toLowerCase())) {
          if (poke == pokemons[i].name!.toLowerCase()) {
            matchQuerysug.add(pokemons[i]);
          }
        } else {
          msg = 'Pokemon Não Encontrado';
          bool result2 = false;
        }
      }
    }

    return ListView.builder(
      itemCount: matchQuerysug.isEmpty ? 1 : matchQuerysug.length,
      itemBuilder: (context, index) => !result2
          ? Container(
              child: Center(
                child: Text(msg),
              ),
            )
          : Pokemoncard(
              id: matchQuerysug[index].id.toString(),
              name: matchQuerysug[index].name!,
              onPressed: () {},
              type: pokemons[index].types!,
            ),
    );
  }

//Parametro opcional para add sugestão a barra de pesquisa
  @override
  String get searchFieldLabel => 'Pesquisar por...';
}
