import 'package:flutter/material.dart';

import '../widgets/pokemoncard.dart';

class Custonseachdelegate extends SearchDelegate {
  List searchtermrd = [
    'pikachu',
    'mew',
    'chikorita',
    'venonat',
    'alakazan',
    'kakuna',
    'porygon',
    'abra'
  ];

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
        itemBuilder: (context, index) => Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              color: Colors.amber,
              child: Text(matchQuery[index].toString()),
            ));

    // Pokemoncard(
    //       id: '1', img: '', name: 'pokmon', onPressed: () {}, type: []),
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
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                color: Colors.amber,
                child: Text(matchQuery[index].toString()),
              ),
            ));
  }
}
