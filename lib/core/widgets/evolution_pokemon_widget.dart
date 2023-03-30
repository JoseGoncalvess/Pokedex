import 'package:flutter/material.dart';

import '../theme/backgroud_color.dart';

class EvolutionPokemonWidget extends StatefulWidget {
  const EvolutionPokemonWidget(
      {super.key,
      required this.types,
      required this.id,
      required this.evolutions});

  final List<String> types;
  final List<dynamic> evolutions;
  final int id;

  @override
  State<EvolutionPokemonWidget> createState() => _EvolutionPokemonWidgetState();
}

class _EvolutionPokemonWidgetState extends State<EvolutionPokemonWidget> {
  List<dynamic> evolutions = [];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Evoluções'.toUpperCase(),
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.w900,
                      color:
                          Backgroud().getBackgroudType(type: widget.types[0]),
                      fontFamily: 'Nunito'))
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.network(
                    'http://www.serebii.net/pokemongo/pokemon/${widget.evolutions[0].num}.png',
                    scale: 1.5,
                  ),
                  Text(widget.evolutions[0].name,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey.withOpacity(0.8),
                          fontFamily: 'Nunito')),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
