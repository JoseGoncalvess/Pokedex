import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokedexx/model/pokev2model.dart';

import '../core/custons/cunstomlitseach.dart';
import '../core/widgets/pokemoncard.dart';
import '../services/pokemon_services.dart';

class PageTest extends StatefulWidget {
  const PageTest({super.key, required this.pokemons});
  final List<Pokemon> pokemons;

  @override
  State<PageTest> createState() => _PageTestState();
}

class _PageTestState extends State<PageTest> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(),
    );
  }
}
