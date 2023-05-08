import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedexx/core/widgets/pokecardgrid.dart';
import 'package:pokedexx/model/pokev2model.dart';
import '../core/theme/set_lastpoekom.dart';
import '../core/widgets/pokemoncard.dart';
import '../services/pokemon_services.dart';
import 'details_page.dart';

class Pagepokemon extends StatefulWidget {
  const Pagepokemon({super.key, required this.geration});
  final List geration;

  @override
  State<Pagepokemon> createState() => _PagepokemonState();
}

class _PagepokemonState extends State<Pagepokemon> {
  List<dynamic> allPoker = [];
  List<Pokemon> pokemonv2 = [];
  String msg = 'VAi aparecer aqui ';
  bool loading = false;
  bool layout = true;
  int pointStart = 0;

  getpoke() {
    PokemonServices()
        .getpokemonforgerationstart(widget.geration, pointStart)
        .then((value) => {
              setState(() {
                pokemonv2 = value.pokemon;
                // tipos = value.types;
                msg = value.erro;
                pointStart = pokemonv2.length;
              }),
              getpoketime(),
              log(pokemonv2.length.toString()),
              setState(() {
                loading = true;
              })
            })
        .catchError((onError) => msg = onError);
  }

  getpoketime() async {
    List geratio = widget.geration;
    for (var i = pokemonv2.last.id! + 1;
        i < int.parse(SetLastpoekom().getlastpoke(geratio.last.url)) + 1;
        i++) {
      final dio = Dio();
      var response = await dio.get('https://pokeapi.co/api/v2/pokemon/$i');
      var p = response.data as Map<String, dynamic>;
      if (response.statusCode == 200) {
        var poke = Pokemon.fromJson(p);
        setState(() {
          pokemonv2.add(poke);
        });
      }
    }
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
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            'Pokedex',
            style: TextStyle(
                color: Colors.red.withOpacity(0.8),
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'BebasNEue'),
          ),
        ),
        actions: [
          loading == false
              ? const Icon(Icons.keyboard_double_arrow_down_sharp)
              : IconButton(
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
                      children: pokemonv2
                          .map((e) => Pokecardgrid(
                                name: e.name!,
                                type: e.types!,
                                id: e.id.toString(),
                                img: e.name!,
                                onPressed: () {},
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
                      itemCount: pokemonv2.isEmpty ? 1 : pokemonv2.length,
                      itemBuilder: (BuildContext context, int index) {
                        return !loading
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(
                                      color: Colors.red[700],
                                    ),
                                    Text(
                                      'Carregando Pokémons...',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'Nunito'),
                                    )
                                  ],
                                ),
                              )
                            : Pokemoncard(
                                onPressed: () {
                                  log('VAI CARAI ${pokemonv2[index].id}');
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => DetailsPage(
                                              id: pokemonv2[index].id!,
                                              name: pokemonv2[index].name!,
                                              types: pokemonv2[index].types!,
                                            )),
                                  );
                                },
                                name: pokemonv2[index].name!,
                                type: pokemonv2[index].types!,
                                id: pokemonv2[index].id.toString());
                      },
                    ),
                  )
                ],
              ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   getpoketime();
      // }),
    );
  }
}
