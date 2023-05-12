import 'package:flutter/material.dart';
import 'package:pokedexx/core/widgets/custons/tab_atrybuty_widget.dart';

import '../../core/theme/backgroud_color.dart';
import '../../core/theme/localepokemon.dart';
import '../../core/widgets/evolution_pokemon_widget.dart';
import '../../core/widgets/infopoke_widget.dart';
import '../../core/widgets/poke_stats.dart';
import '../../core/widgets/secundari_infopoke_widget.dart';
import '../../model/location_poke_area.dart';
import '../../model/poke_evolution.dart';
import '../../model/pokev2model.dart';

class DetailsPokeWidget extends StatefulWidget {
  final List<Type> types;
  final List<String> vantagem;
  final List<String> desvantagem;
  final String weight;
  final String height;
  final String name;
  final List<PokeEvolution> evolutions;
  final List<LocatioArea> localization;
  final List<Stat> pokemonstat;
  final int id;

  const DetailsPokeWidget(
      {Key? key,
      required this.types,
      required this.vantagem,
      required this.desvantagem,
      required this.weight,
      required this.height,
      required this.name,
      required this.evolutions,
      required this.localization,
      required this.pokemonstat,
      required this.id})
      : super(key: key);

  @override
  State<DetailsPokeWidget> createState() => _DetailsPokeWidgetState();
}

class _DetailsPokeWidgetState extends State<DetailsPokeWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.54,
      child: PageView(scrollDirection: Axis.horizontal, children: [
        SizedBox(
          child: Column(
            children: [
              InfopokeWidget(
                height: widget.height,
                name: widget.name,
                types: widget.types,
                width: widget.weight,
              ),
              SecundariinfopokeWidget(
                type: widget.types,
                localization: widget.localization.isEmpty
                    ? 'Evolução'
                    : Localepokemon().localpokemon(
                        city: widget.localization[0].name.toString()),
              ),
              EvolutionPokemonWidget(
                evolutions: widget.evolutions,
                id: widget.id,
                types: widget.types,
              ),
            ],
          ),
        ),
        Column(
          children: [
            Text(
              'Poke Status',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  fontWeight: FontWeight.w900,
                  color: Backgroud().getBackgroudColor(
                      type: widget.types[0].type.name.toString()),
                  fontFamily: 'Nunito'),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.29,
              child: ListView.builder(
                itemCount: widget.pokemonstat.length,
                itemBuilder: (context, index) => PokeStats(
                    types: widget.types,
                    nameStats: widget.pokemonstat[index].stat!.name,
                    statsPower: widget.pokemonstat[index].baseStat!),
              ),
            ),
            TabAtrybutyWidget(
              desvantagem: widget.desvantagem,
              types: widget.types,
              vantagem: widget.vantagem,
            )
          ],
        )
      ]),
    );
  }
}
