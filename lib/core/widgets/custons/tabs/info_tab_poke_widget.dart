import 'package:flutter/material.dart';
import 'package:pokedexx/model/atributi_type_model.dart';
import 'package:pokedexx/model/location_poke_area.dart';
import 'package:pokedexx/model/poke_evolution.dart';
import 'package:pokedexx/pages/details_page/details_poke_widget.dart';
import '../../../../pages/details_page/detailstype_poker.dart';
import 'package:pokedexx/model/pokev2model.dart';

import '../../../theme/backgroud_color.dart';
import '../../../theme/localepokemon.dart';
import '../../evolution_pokemon_widget.dart';
import '../../infopoke_widget.dart';
import '../../secundari_infopoke_widget.dart';

class InfoTabPokeWidget extends StatefulWidget {
  final String weight;
  final String height;
  final List<Stat> pokemonstat;
  final List<Type> types;
  final List<PokeEvolution> evolutions;
  final List<LocatioArea> localization;
  final List<AtributsType> atributo;
  final List<String> vantagem;
  final List<String> desvantagem;
  final int id;
  final String name;

  const InfoTabPokeWidget(
      {Key? key,
      required this.types,
      required this.evolutions,
      required this.localization,
      required this.atributo,
      required this.vantagem,
      required this.desvantagem,
      required this.weight,
      required this.height,
      required this.pokemonstat,
      required this.id,
      required this.name})
      : super(key: key);

  @override
  State<InfoTabPokeWidget> createState() => _InfoTabPokeWidgetState();
}

class _InfoTabPokeWidgetState extends State<InfoTabPokeWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController _tabcontroller = TabController(length: 2, vsync: this);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.59,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.06,
            child: TabBar(
                unselectedLabelColor: Colors.grey,
                indicatorColor: Backgroud().getBackgroudColor(
                    type: widget.types[0].type.name.toString()),
                labelColor: Backgroud().getBackgroudColor(
                    type: widget.types[0].type.name.toString()),
                labelStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    fontWeight: FontWeight.w900,
                    color: Backgroud().getBackgroudColor(
                        type: widget.types[0].type.name.toString()),
                    fontFamily: 'Nunito'),
                controller: _tabcontroller,
                tabs: const [
                  Tab(
                    text: 'Poke Info',
                  ),
                  Tab(
                    text: 'Poke Status',
                  )
                ]),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.53,
            child: TabBarView(controller: _tabcontroller, children: [
              Tab(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: widget.types
                          .map((e) => TypelistDetails(pokemon: e.type.name))
                          .toList(),
                    ),
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
              Tab(
                child: DetailsPokeWidget(
                  desvantagem: widget.desvantagem,
                  evolutions: widget.evolutions,
                  height: widget.height,
                  weight: widget.weight,
                  id: widget.id,
                  localization: widget.localization,
                  name: widget.name,
                  pokemonstat: widget.pokemonstat,
                  types: widget.types,
                  vantagem: widget.vantagem,
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
