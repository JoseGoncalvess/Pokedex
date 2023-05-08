import 'package:flutter/material.dart';
import 'package:pokedexx/model/pokev2model.dart';
import '../../model/poke_evolution.dart';
import '../theme/backgroud_color.dart';
import '../theme/gifimage_pokemon.dart';

class EvolutionPokemonWidget extends StatefulWidget {
  const EvolutionPokemonWidget(
      {super.key,
      required this.types,
      required this.id,
      required this.evolutions});

  final List<Type> types;
  final List<PokeEvolution> evolutions;
  final int id;

  @override
  State<EvolutionPokemonWidget> createState() => _EvolutionPokemonWidgetState();
}

class _EvolutionPokemonWidgetState extends State<EvolutionPokemonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: [
          Text(
            'Evoluções'.toUpperCase(),
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.06,
                fontWeight: FontWeight.w900,
                color: Backgroud().getBackgroudType(
                    type: widget.types[0].type.name.toString()),
                fontFamily: 'Nunito'),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.evolutions.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: Image.network(
                                GifimagePokemon()
                                    .getimag(widget.evolutions[index].pokename),
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text(widget.evolutions[index].pokename,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.grey.withOpacity(0.8),
                                    fontFamily: 'Nunito')),
                          ],
                        ),
                      ),
                      // Icon(
                      //   Icons.arrow_right_alt_rounded,
                      //   color:
                      //       Backgroud().getBackgroudType(type: widget.types[0]),
                      // )
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
