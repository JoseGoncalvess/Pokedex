import 'package:flutter/material.dart';
import 'package:pokedexx/pages/pokemonpage.dart';

import '../services/pokemon_services.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  String msg = '';

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3));
    PokemonServices().getpokemon().then((value) => {
          Future.delayed(const Duration(seconds: 3)).then((value) => {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const Pagepokemon(),
                ))
              })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Image.asset('assets/img/splash.gif'),
        ),
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return Text(msg); 
// }
