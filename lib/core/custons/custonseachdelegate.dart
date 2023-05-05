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
    for (var i = 0; i < 10; i++) {
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
          Padding(
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Nunito'),
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
                          future: PokemonServices()
                              .seachpokemon(namecontroller.text),
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                              case ConnectionState.waiting:
                                return const Expanded(
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                );
                                break;

                              default:
                                if (snapshot.hasError) {
                                  return Expanded(
                                    child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 100,
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          'assets/img/pokeLoad.gif'))),
                                            ),
                                            Text(
                                              'Pokémon não Encontrado',
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.03,
                                                  fontWeight: FontWeight.w800,
                                                  fontFamily: 'Nunito'),
                                            ),
                                            Text(
                                              'Tente procurar pela #',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.022,
                                                  fontWeight: FontWeight.w800,
                                                  fontFamily: 'Nunito'),
                                            )
                                          ],
                                        )),
                                  );
                                  print(
                                      'Esse aqui é o erro => ${snapshot.error.toString()}');
                                }
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: ListView(
                                    children: [
                                      Pokemoncard(
                                        id: snapshot.data!.id.toString(),
                                        name: snapshot.data!.name!,
                                        onPressed: () {},
                                        type: snapshot.data!.types!,
                                      ),
                                    ],
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
