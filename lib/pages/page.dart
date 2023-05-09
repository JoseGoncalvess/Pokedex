import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../model/evolutionmodel.dart';
import '../services/pokemon_services.dart';

class PAgetest extends StatefulWidget {
  const PAgetest({super.key});

  @override
  State<PAgetest> createState() => PAgetestState();
}

class PAgetestState extends State<PAgetest> {
  List<EvolutionDetail> list = [EvolutionDetail(minHappiness: 0)];

  String msg = '';
  getpoke(String name) async {
    final dio = Dio();
    var response = await dio
        .get('https://pokeapi.co/api/v2/pokemon-species/${name.toLowerCase()}');
    var corpo = response.data as Map<String, dynamic>;
    setState(() {
      msg = corpo['evolution_chain']['url'].toString();
    });
  }

  @override
  void initState() {
    // getpoke();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: GestureDetector(
            onTap: () {
              PokemonServices().getpokeSpecie(pokename: 'spearow');
              // getpoke('spearow');
            },
            child: Container(
                color: Colors.amber,
                alignment: Alignment.center,
                height: 100,
                width: 300,
                child: Text(msg))),
      ),
    );
  }
}
