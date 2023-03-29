import 'package:flutter/material.dart';

import '../model/spaw_pokemon.dart';
import '../services/pokemon_services.dart';

class pagetest extends StatefulWidget {
  const pagetest({super.key});

  @override
  State<pagetest> createState() => _pagetestState();
}

class _pagetestState extends State<pagetest> {
  List<EncounterDetail> localization = [];
  String msg = '';
  getpoke() {
    ;
    PokemonServices().gettypepokelocalizatio(1).then((value) {
      setState(() {
        localization = value.list as List<EncounterDetail>;
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
          child: Text(localization.toString()),
        ),
      ),
    );
  }
}
