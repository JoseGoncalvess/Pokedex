import 'dart:developer';

import 'package:flutter/material.dart';
import '../model/geration_poke_wisget.dart';
import '../services/pokemon_services.dart';
import 'homepage.dart';
import 'package:flutter/src/widgets/framework.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  String msg = '';
  List<Itemgertion> list = [];

  @override
  void initState() {
    super.initState();

    GerationPokeWisget().getgerationwidget(9).then((value) => {
          setState(() {
            list = value.geration;
          }),
          log(list.length.toString())
        });

    Future.delayed(const Duration(seconds: 3));
    PokemonServices().getpokemon().then((value) => {
          Future.delayed(const Duration(seconds: 3)).then((value) => {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Homepage(pokegeration: list),
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
