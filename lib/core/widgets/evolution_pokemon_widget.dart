import 'package:flutter/gestures.dart';
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
      height: MediaQuery.of(context).size.height * 0.35,
      // color: Colors.red,
      child: Column(
        children: [
          Text(
            'Evoluções'.toUpperCase(),
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.06,
                fontWeight: FontWeight.w900,
                color: Backgroud().getBackgroudColor(
                    type: widget.types[0].type.name.toString()),
                fontFamily: 'Nunito'),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
                  widget.evolutions.isEmpty ? 1 : widget.evolutions.length,
              dragStartBehavior: DragStartBehavior.start,
              itemBuilder: (context, index) {
                return widget.evolutions.isEmpty
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                child:
                                    Image.asset('./assets/img/pokeLoad.gif')),
                            Flexible(
                              child: Text(
                                'Este Pokémon Não Possui Evoluções!',
                                style: TextStyle(
                                    color: Backgroud().getBackgroudType(
                                        type: widget.types[0].type.name
                                            .toString()),
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Nunito'),
                              ),
                            )
                          ],
                        ),
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  widget.evolutions[index].minLevel == 'Ovo'
                                      ? 'Nesce de Ovo'
                                      : 'Lv. min: ${widget.evolutions[index].minLevel.toUpperCase()}',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.grey.withOpacity(0.8),
                                      fontFamily: 'Nunito'),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.height * 0.10,
                                  child: Image.network(
                                    GifimagePokemon().getimag(
                                        widget.evolutions[index].pokename),
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      return loadingProgress == null
                                          ? child
                                          : Image.asset(
                                              'assets/img/pokeLoad.gif',
                                              scale: 0.9,
                                            );
                                    },
                                    scale: 0.6,
                                  ),
                                ),
                                Text(
                                  widget.evolutions[index].pokename
                                      .toUpperCase(),
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                      fontWeight: FontWeight.w900,
                                      color: Backgroud().getBackgroudColor(
                                          type: widget.types[0].type.name
                                              .toString()),
                                      fontFamily: 'Nunito'),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
