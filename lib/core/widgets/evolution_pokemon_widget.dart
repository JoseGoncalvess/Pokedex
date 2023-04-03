import 'package:flutter/material.dart';

import '../theme/backgroud_color.dart';
import '../theme/gifimage_pokemon.dart';

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
      height: MediaQuery.of(context).size.height * 0.17,
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
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: Image.network(
                                GifimagePokemon()
                                    .getimag(widget.evolutions[index].name),
                                fit: BoxFit.contain,
                              ),
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
