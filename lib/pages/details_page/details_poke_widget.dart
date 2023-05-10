import 'package:flutter/material.dart';

import '../../core/theme/backgroud_color.dart';
import '../../core/theme/localepokemon.dart';
import '../../core/widgets/atribut_type_widget.dart';
import '../../core/widgets/evolution_pokemon_widget.dart';
import '../../core/widgets/infopoke_widget.dart';
import '../../core/widgets/poke_stats.dart';
import '../../core/widgets/secundari_infopoke_widget.dart';
import '../../model/location_poke_area.dart';
import '../../model/poke_evolution.dart';
import '../../model/pokev2model.dart';

class DetailsPokeWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.54,
      child: PageView(scrollDirection: Axis.horizontal, children: [
        SizedBox(
          child: Column(
            children: [
              InfopokeWidget(
                height: height,
                name: name,
                types: types,
                width: weight,
              ),
              SecundariinfopokeWidget(
                type: types,
                localization: localization.isEmpty
                    ? 'Evolução'
                    : Localepokemon()
                        .localpokemon(city: localization[0].name.toString()),
              ),
              EvolutionPokemonWidget(
                evolutions: evolutions,
                id: id,
                types: types,
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Text(
                'Poke Status',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    fontWeight: FontWeight.w900,
                    color: Backgroud()
                        .getBackgroudType(type: types[0].type.name.toString()),
                    fontFamily: 'Nunito'),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.332,
                child: ListView.builder(
                  itemCount: pokemonstat.length,
                  itemBuilder: (context, index) => PokeStats(
                      types: types,
                      nameStats: pokemonstat[index].stat!.name,
                      statsPower: pokemonstat[index].baseStat!),
                ),
              ),
              Text(
                'Vantagem',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    fontWeight: FontWeight.w900,
                    color: Backgroud()
                        .getBackgroudType(type: types[0].type.name.toString()),
                    fontFamily: 'Nunito'),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.06,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: vantagem.length,
                  itemBuilder: (context, index) =>
                      AtributTypeWidget(typename: vantagem[index]),
                ),
              ),
              Text(
                'Desvantagem',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    fontWeight: FontWeight.w900,
                    color: Backgroud()
                        .getBackgroudType(type: types[0].type.name.toString()),
                    fontFamily: 'Nunito'),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.06,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: desvantagem.length,
                  itemBuilder: (context, index) =>
                      AtributTypeWidget(typename: desvantagem[index]),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
