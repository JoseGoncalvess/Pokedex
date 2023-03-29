import 'package:flutter/material.dart';
import 'package:pokedexx/core/theme/localepokemon.dart';

import '../model/spaw_pokemon.dart';
import '../services/pokemon_services.dart';

class pagetest extends StatefulWidget {
  const pagetest({super.key});

  @override
  State<pagetest> createState() => pagetestState();
}

class pagetestState extends State<pagetest> {
  List<LocationArea> localization = [];
  String msg = '';
  getpoke() {
    PokemonServices().gettypepokelocalizatio(1).then((value) {
      setState(() {
        localization = value.list as List<LocationArea>;
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
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(
        child: Center(
          child: Text(Localepokemon()
              .localpokemon(city: localization[0].name.toString())),
        ),
      ),
    );
  }
}
