// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pokedexx/model/pokev2model.dart';
import '../widgets/pokemoncard.dart';

class Custonseachdelegate extends SearchDelegate {
  // final List type;
  final List<Pokemon> pokemons;
  final List<String> searchtermrd;
  final List<Species> tipyes;
  String msg = '';

  final Function() onPressed;
  Custonseachdelegate({
    required this.tipyes,
    required this.pokemons,
    required this.searchtermrd,
    required this.onPressed,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
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
            log(matchQuery.length.toString());
          }
        } else {
          msg = 'Pokemon Não Encontrado';
        }
      }
    }

    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) => Pokemoncard(
              id: matchQuery[index].id.toString(),
              name: matchQuery[index].name!,
              onPressed: onPressed,
              type: tipyes,
            ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Pokemon> matchQuerysug = [];

    for (var i = 0; i < pokemons.length; i++) {
      for (var poke in searchtermrd) {
        if (poke.toLowerCase().contains(query.toLowerCase())) {
          if (poke == pokemons[i].name!.toLowerCase()) {
            matchQuerysug.add(pokemons[i]);
          }
        } else {
          msg = 'Pokemon Não Encontrado';
        }
      }
    }

    return ListView.builder(
      itemCount: matchQuerysug.length,
      itemBuilder: (context, index) => Pokemoncard(
        id: matchQuerysug[index].id.toString(),
        name: matchQuerysug[index].name!,
        onPressed: () {
          // Navigator.of(context).push(
          //     // MaterialPageRoute(
          //     //     builder: (context) => DetailsPage(
          //     //           nextEvolution: pokemons[index].nextEvolution as List,
          //     //           prevEvolution: pokemons[index].prevEvolution as List,
          //     //           height: pokemons[index].height,
          //     //           width: pokemons[index].weight,
          //     //           img: pokemons[index].img,
          //     //           id: pokemons[index].id,
          //     //           name: pokemons[index].name,
          //     //           types: pokemons[index].type,
          //     //           candy: pokemons[index].candy,
          //     //         )),
          //     );
        },
        type: tipyes,
      ),
    );
  }

//Parametro opcional para add sugestão a barra de pesquisa
  @override
  String get searchFieldLabel => 'Pesquisar por...';
}
