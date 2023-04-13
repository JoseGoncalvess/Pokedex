// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../model/pokeModel.dart';
import '../widgets/pokemoncard.dart';

class Custonseachdelegate extends SearchDelegate {
  // final List type;
  final List<Pokemon> poemons;
  final List<String> searchtermrd;
  String msg = '';

  final Function() onPressed;
  Custonseachdelegate({
    required this.poemons,
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

    for (var i = 0; i < poemons.length; i++) {
      for (var poke in searchtermrd) {
        if (poke.toLowerCase() == query.toLowerCase()) {
          if (poke == poemons[i].name.toLowerCase()) {
            // log('$poke == ${poemons[i].name.toLowerCase()}');
            matchQuery.add(poemons[i]);
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
              name: matchQuery[index].name,
              onPressed: onPressed,
              type: matchQuery[index].type,
            ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Pokemon> matchQuerysug = [];

    for (var i = 0; i < poemons.length; i++) {
      for (var poke in searchtermrd) {
        if (poke.toLowerCase().contains(query.toLowerCase())) {
          if (poke == poemons[i].name.toLowerCase()) {
            matchQuerysug.add(poemons[i]);
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
        name: matchQuerysug[index].name,
        onPressed: onPressed,
        type: matchQuerysug[index].type,
      ),
    );
  }
}
