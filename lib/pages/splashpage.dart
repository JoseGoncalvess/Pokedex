import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pokedexx/model/gerationpomeon_model.dart';
import '../core/custons/custonseachdelegate.dart';
import '../core/theme/geration_poke_wisget.dart';
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
  List<Result> geraton = [];

  @override
  void initState() {
    CustonseachdelegateState.getpokemondelegate();
    super.initState();
    PokemonServices().getpokegeration(1).then((value) => {
          setState(() {
            geraton = value.list as List<Result>;
          }),
        });

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
                  builder: (context) => Homepage(
                    pokegeration: list,
                    geratio: geraton,
                  ),
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
