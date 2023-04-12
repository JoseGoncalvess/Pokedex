// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../model/pokeModel.dart';
import '../widgets/pokemoncard.dart';

class Custonseachdelegate extends SearchDelegate {
  // final List type;
  final List<Pokemon> poemons;
  final List<String> searchtermrd;

  final Function() onPressed;
  Custonseachdelegate({
    required this.poemons,
    required this.searchtermrd,
    required this.onPressed,
  });

  // List<String> searchtermrd = terme.isEmpty?['pikachu', 'alakazan','abra','kakuna']:terme;

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
    List<String> matchQuery = [];
    for (var poke in searchtermrd) {
      if (poke.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(poke);
      }
    }

    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) => Pokemoncard(
              id: poemons[index].id.toString(),
              name: poemons[index].name,
              onPressed: onPressed,
              type: poemons[index].type,
            ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var poke in searchtermrd) {
      if (poke.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(poke);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) => Pokemoncard(
        id: poemons[index].id.toString(),
        name: poemons[index].name,
        onPressed: onPressed,
        type: poemons[index].type,
      ),
    );
  }
}
