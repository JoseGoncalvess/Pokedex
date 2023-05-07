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
  getpoke() {
    PokemonServices().gettypepokeevolution(3).then((value) {
      setState(() {
        list = value.list as List<EvolutionDetail>;
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
        title: const Text(''),
      ),
      body: Center(
        child: GestureDetector(
            onTap: () => getpoke(),
            child: Container(
                color: Colors.amber,
                alignment: Alignment.center,
                height: 100,
                width: 300,
                child: Text('ok'))),
      ),
    );
  }
}
