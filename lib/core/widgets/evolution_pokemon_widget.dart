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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        children: [
          Text('Evoluções'.toUpperCase(),
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.w900,
                  color: Backgroud().getBackgroudType(type: widget.types[0]),
                  fontFamily: 'Nunito')),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.evolutions.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Column(
                          children: [
                            Image.network(
                              'http://www.serebii.net/pokemongo/pokemon/${widget.evolutions[index].num}.png',
                              scale: 1.6,
                            ),
                            Text(widget.evolutions[index].name,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.03,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.grey.withOpacity(0.8),
                                    fontFamily: 'Nunito')),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
