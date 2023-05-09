import 'package:flutter/material.dart';
import 'package:pokedexx/model/pokev2model.dart';
import '../../../pages/details_page/details_page.dart';
import '../pokemoncard.dart';

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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsPage(
                              id: widget.pokemons[index].id!,
                              name: widget.pokemons[index].name!,
                              types: widget.pokemons[index].types!,
                            )));
              },
              type: widget.pokemons[index].types!,
            ),
    );
  }
}
