import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/backgroud_color.dart';
import '../../core/widgets/atribut_type_widget.dart';
import '../../core/widgets/poke_stats.dart';
import '../../model/atributi_type_model.dart';
import '../../model/evolutionmodel.dart';
import '../../services/pokemon_services.dart';

class PAgetest extends StatefulWidget {
  const PAgetest({super.key});

  @override
  State<PAgetest> createState() => PAgetestState();
}

class PAgetestState extends State<PAgetest> {
  List<EvolutionDetail> list = [EvolutionDetail(minHappiness: 0)];

  String msg = '';
  getpoke({required String type}) async {}

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
      body: Column(
        children: [
          GestureDetector(
              onTap: () {
                // PokemonServices().getpokeSpecie(pokename: 'spearow');
                getpoke(type: 'water');
              },
              child: Container(
                  color: Colors.amber,
                  alignment: Alignment.center,
                  height: 100,
                  width: 300,
                  child: Column(
                    children: [
                      Text(msg),
                    ],
                  ))),
          AtributTypeWidget(
            typename: 'ghost',
          )
        ],
      ),
    );
  }
}
