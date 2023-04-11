import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pokedexx/core/widgets/pokecardgrid.dart';
import 'package:pokedexx/model/pokemon_model_v2.dart';
import '../core/widgets/pokemoncard.dart';
import '../model/geration_poke_wisget.dart';
import '../model/pokeModel.dart';
import '../services/pokemon_services.dart';
import 'details_page.dart';
import 'homepage.dart';

class Pagepokemon extends StatefulWidget {
  const Pagepokemon({super.key});

  @override
  State<Pagepokemon> createState() => _PagepokemonState();
}

class _PagepokemonState extends State<Pagepokemon> {
  List<Pokemon> allPoker = [];
  List<PokemonV2> pokemonv2 = [];
  String msg = 'VAi aparecer aqui ';
  bool leading = true;
  bool layout = true;

  getpoke() {
    setState(() {
      leading = false;
    });
    PokemonServices().getpokemon().then((value) {
      setState(() {
        allPoker = value.list as List<Pokemon>;
        msg = value.msg;

        setState(() {
          leading = true;
        });
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Pokedex',
          style: TextStyle(
              color: Colors.grey.withOpacity(0.8),
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: 'BebasNEue'),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  layout = !layout;
                });
              },
              icon: layout
                  ? Icon(
                      Icons.grid_view_sharp,
                      color: Colors.grey.withOpacity(0.8),
                      size: 30,
                    )
                  : Icon(
                      Icons.list_rounded,
                      color: Colors.grey.withOpacity(0.8),
                      size: 30,
                    ))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.white
            // image: DecorationImage(
            //     image: const AssetImage(
            //       'assets/img/BK.jpg',
            //     ),
            //     colorFilter: ColorFilter.mode(
            //         Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
            //         BlendMode.modulate),
            //     fit: BoxFit.cover),
            ),
        child: !layout
            ? Column(
                children: [
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      children: allPoker
                          .map((e) => Pokecardgrid(
                                name: e.name,
                                type: e.type,
                                id: e.id.toString(),
                                img: e.img,
                                onPressed: () {
                                  // log(allPoker[e.id - 1].id.toString());
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                            nextEvolution: allPoker[e.id - 1]
                                                .nextEvolution as List,
                                            prevEvolution: allPoker[e.id - 1]
                                                .prevEvolution as List,
                                            height: allPoker[e.id - 1].height,
                                            width: allPoker[e.id - 1].weight,
                                            img: allPoker[e.id - 1].img,
                                            id: allPoker[e.id - 1].id,
                                            name: allPoker[e.id - 1].name,
                                            types: allPoker[e.id - 1].type,
                                            candy: allPoker[e.id - 1].candy,
                                          )

                                      // Detailpoker(
                                      //     name: allPoker[e.id - 1].name,
                                      //     type: allPoker[e.id - 1].type,
                                      //     id: allPoker[e.id - 1].id.toString(),
                                      //     img: allPoker[e.id - 1].img)

                                      ));
                                },
                              ))
                          .toList(),
                    ),
                  )
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: !leading ? 1 : allPoker.length,
                      itemBuilder: (BuildContext context, int index) {
                        return !leading
                            ? SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.red[700],
                                  ),
                                ),
                              )
                            : Pokemoncard(
                                onPressed: () {
                                  log('VAI CARAI ${allPoker[index].id}');
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => DetailsPage(
                                              nextEvolution: allPoker[index]
                                                  .nextEvolution as List,
                                              prevEvolution: allPoker[index]
                                                  .prevEvolution as List,
                                              height: allPoker[index].height,
                                              width: allPoker[index].weight,
                                              img: allPoker[index].img,
                                              id: allPoker[index].id,
                                              name: allPoker[index].name,
                                              types: allPoker[index].type,
                                              candy: allPoker[index].candy,
                                            )),
                                  );
                                },
                                name: allPoker[index].name,
                                type: allPoker[index].type,
                                id: allPoker[index].id.toString(),
                                img: allPoker[index].img);
                      },
                    ),
                  )
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // PokemonServices().gettypepokeevolution(3);
        // GifimagePokemon().getimag('Nidoran ♂ (Male)');
        // PokemonServices().gettypepokelocalizatio(1);
        // GerationPokeWisget().getgerationwidget(9);
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => const Homepage()));
      }),
    );
  }
}
