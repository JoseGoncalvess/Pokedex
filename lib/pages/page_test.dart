import 'package:flutter/material.dart';
import 'package:pokedexx/model/pokev2model.dart';
import '../core/theme/gifimage_pokemon.dart';

class PageTest extends StatefulWidget {
  const PageTest({super.key, required this.pokemons});
  final List<Pokemon> pokemons;

  @override
  State<PageTest> createState() => _PageTestState();
}

class _PageTestState extends State<PageTest> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.26,
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(GifimagePokemon().getimag('nidoran-m'),
                      scale: 0.55)),
            ),
          ),
        ),
      ),
    );
  }
}
