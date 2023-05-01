import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedexx/model/pokev2model.dart';

import '../widgets/pokemoncard.dart';

class Cunstomlitseach extends StatefulWidget {
  const Cunstomlitseach({
    Key? key,
    required this.pokemons,
  }) : super(key: key);

  final List<Pokemon> pokemons;
  @override
  State<Cunstomlitseach> createState() => CunstomlitseachState();
}

class CunstomlitseachState extends State<Cunstomlitseach> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.pokemons.isEmpty ? 1 : widget.pokemons.length,
      itemBuilder: (context, index) => widget.pokemons.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Pokemoncard(
              id: widget.pokemons[index].id.toString(),
              name: widget.pokemons[index].name!,
              onPressed: () {},
              type: widget.pokemons[index].types!,
            ),
    );
  }
}
