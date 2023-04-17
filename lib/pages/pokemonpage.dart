import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pokedexx/core/widgets/pokecardgrid.dart';
import 'package:pokedexx/model/pokev2model.dart';
import '../core/widgets/pokemoncard.dart';

import '../services/pokemon_services.dart';
import 'details_page.dart';
import 'homepage.dart';

class Pagepokemon extends StatefulWidget {
  const Pagepokemon({super.key, required this.geration});
  final List geration;

  @override
  State<Pagepokemon> createState() => _PagepokemonState();
}

class _PagepokemonState extends State<Pagepokemon> {
  List<dynamic> allPoker = [];
  List<Pokemon> pokemonv2 = [];
  List<Species> tipos = [
    Species(name: 'Poison', url: ''),
    Species(name: 'Flying', url: 'url')
  ];
  String msg = 'VAi aparecer aqui ';
  bool loading = true;
  bool layout = true;

  getpoke() {
    setState(() {
      loading = false;
      log(loading.toString());
    });
    PokemonServices()
        .getpokemonforgeration(widget.geration)
        .then((value) => {
              setState(() {
                pokemonv2 = value.pokemon;
                // tipos = value.types;
                msg = value.erro;
              }),
              log(pokemonv2.length.toString())
            })
        .catchError((onError) {
      msg = onError.toString();
    });

    setState(() {
      loading = true;
    });
  }

  @override
  void initState() {
    log(loading.toString());
    getpoke();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            'Pokedex',
            style: TextStyle(
                color: Colors.grey.withOpacity(0.8),
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'BebasNEue'),
          ),
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
                                          )));
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
                      itemCount: !loading ? 1 : pokemonv2.length,
                      itemBuilder: (BuildContext context, int index) {
                        return !loading
                            ? Container(
                                child: Center(
                                  // color: Colors.white,
                                  // height: MediaQuery.of(context).size.height,
                                  // width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.red[700],
                                    ),
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
                                name: pokemonv2[index].name!,
                                type: tipos,
                                id: pokemonv2[index].id.toString());
                      },
                    ),
                  )
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        getpoke();
      }),
    );
  }
}
