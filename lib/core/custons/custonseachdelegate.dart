import 'dart:math';

import 'package:flutter/material.dart';

import '../../model/pokev2model.dart';
import '../../services/pokemon_services.dart';
import '../widgets/pokemoncard.dart';
import 'cunstomlitseach.dart';

class Custonseachdelegate extends StatefulWidget {
  const Custonseachdelegate({Key? key}) : super(key: key);

  @override
  State<Custonseachdelegate> createState() => CustonseachdelegateState();
}

class CustonseachdelegateState extends State<Custonseachdelegate> {
  static List<Pokemon> pokemons = [];
  static getpokemondelegate() {
    for (var i = 0; i < 8; i++) {
      int number = Random().nextInt(300);
      PokemonServices()
          .getpokemons('https://pokeapi.co/api/v2/pokemon/$number')
          .then((value) => {
                pokemons.add(value.pokemon),
              });
    }
  }

  var customfocus = FocusNode();
  var loading = true;

  TextEditingController namecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context, null);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: MediaQuery.of(context).size.height * 0.045,
                        color: Colors.grey,
                      )),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(22)),
                          hintText: 'Qual pokemon deseja  encontrar?',
                          hintStyle: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Nunito'),
                          fillColor: Colors.grey.withOpacity(0.3),
                          filled: true),
                      focusNode: customfocus,
                      controller: namecontroller,
                      onSubmitted: (value) {
                        setState(() {
                          loading = false;
                        });
                      },
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        namecontroller.clear();
                        setState(() {
                          loading = true;
                        });
                      },
                      icon: Icon(
                        Icons.refresh_outlined,
                        size: MediaQuery.of(context).size.height * 0.045,
                        color: Colors.grey,
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: loading
                  ? Cunstomlitseach(
                      pokemons: pokemons,
                    )
                  : Column(children: [
                      FutureBuilder(
                          future: CunstomlitseachState().seachpokemon(
                              namecontroller.text.toString().toLowerCase()),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: ListView(
                                  children: [
                                    Pokemoncard(
                                      id: snapshot.data.id.toString(),
                                      name: snapshot.data.name!,
                                      onPressed: () {},
                                      type: snapshot.data.types!,
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Expanded(
                                child: Container(
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              );
                            }
                          })
                    ]),
            ),
          )
        ],
      ),
    ));
  }
}
