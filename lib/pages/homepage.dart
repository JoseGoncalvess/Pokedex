import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pokedexx/model/pokev2model.dart';
import 'package:pokedexx/pages/page_test.dart';
import '../core/theme/geration_poke_wisget.dart';
import '../core/widgets/pokemon_geration_widget.dart';
import '../core/widgets/seach_pokemon_widget.dart';
import '../model/gerationpomeon_model.dart';
import '../services/pokemon_services.dart';

class Homepage extends StatefulWidget {
  const Homepage(
      {super.key, required this.geratio, required this.pokegeration});

  final List<Result> geratio;
  final List<Itemgertion> pokegeration;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Pokemon> allPoker = [];

  List<String> pokenames = [];
  String msg = '';

  getpoke() {
    PokemonServices().getpokemonforgeration(widget.geratio, 0).then((value) => {
          setState(() {
            allPoker = value.pokemon;
            msg = value.erro;
          }),
          log(allPoker.length.toString())
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
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PageTest(pokemons: allPoker),
            ));
      }),
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
                      color: Colors.red.withOpacity(0.8),
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
                    const SeachPokemonWidget(),
                    SizedBox(
                      // color: Colors.brown,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.67,
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: widget.pokegeration
                            .map((e) => PokemonGerationWidget(
                                  index: e.index,
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
