import 'dart:developer';

import 'package:flutter/material.dart';

import '../core/custons/custonseachdelegate.dart';
import '../core/widgets/pokemon_geration_widget.dart';
import '../core/widgets/seach_pokemon_widget.dart';
import '../model/geration_poke_wisget.dart';
import '../model/pokeModel.dart';
import '../services/pokemon_services.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, required this.pokegeration});

  final List<Itemgertion> pokegeration;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Pokemon> allPoker = [];
  List<String> pokenames = [];
  String msg = '';
  getpoke() {
    PokemonServices().getpokemon().then((value) {
      setState(() {
        allPoker = value.list as List<Pokemon>;
        msg = value.msg;
      });
      setState(() {
        for (var i = 0; i < value.list.length; i++) {
          pokenames.add(value.list[i].name);
          log(pokenames.first.toString());
        }
      });
    }).catchError((onError) {
      setState(() {
        msg = "DEU ERRO E FOI ISSO>>> $onError";
      });
    });
  }

  @override
  void initState() {
    getpoke();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              left: 150,
              bottom: 560,
              child: SizedBox(
                child: Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      'assets/img/pokeBall.png',
                      color: Colors.grey,
                      scale: 1.7,
                    )),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.23,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Qual pokemon deseja  encontrar?',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.04,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Nunito'),
                        ),
                      ),
                    ),
                    SeachPokemonWidget(
                        allPoker: allPoker, pokenames: pokenames),
                    Container(
                      // color: Colors.brown,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.67,
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: widget.pokegeration
                            .map((e) => PokemonGerationWidget(
                                  index: 1,
                                  geration: e.geration,
                                  img: e.img,
                                  region: e.region,
                                ))
                            .toList(),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
