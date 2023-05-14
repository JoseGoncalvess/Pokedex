import 'package:flutter/material.dart';
import 'package:pokedexx/core/widgets/custons/tabs/tab_atrybuty_widget.dart';
import '../../core/widgets/poke_stats.dart';
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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.61,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
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
      ),
    );
  }
}
