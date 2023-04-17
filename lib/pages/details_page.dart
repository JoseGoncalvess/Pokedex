import 'package:flutter/material.dart';
import 'package:pokedexx/core/theme/backgroud_color.dart';
import 'package:pokedexx/core/widgets/infopoke_widget.dart';
import 'package:pokedexx/model/pokemodel.dart';
import 'package:pokedexx/pages/details_page/detailstype_poker.dart';
import '../core/helpers/clip_container.dart';
import '../core/theme/gifimage_pokemon.dart';
import '../core/theme/localepokemon.dart';
import '../core/widgets/evolution_pokemon_widget.dart';
import '../core/widgets/poke_stats.dart';
import '../core/widgets/secundari_infopoke_widget.dart';
import '../model/pokev2model.dart';
import '../model/spaw_pokemon.dart';
import '../services/pokemon_services.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
    required this.name,
    required this.types,
    required this.id,
    required this.img,
    required this.width,
    required this.height,
    required this.candy,
    required this.nextEvolution,
    required this.prevEvolution,
  }) : super(key: key);

  final String name;
  final List<String> types;
  final int id;
  final String img;
  final String width;
  final String height;
  final String candy;
  final List nextEvolution;
  final List prevEvolution;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<Stat> pokemonstat = [];
  String erroMensseger = '';
  bool leading = true;
  List<dynamic> evolutions = [];
  List<LocationArea> localization = [];
  String msg = '';

  getpokeinfo({required int index}) {
    PokemonServices().gettypepokemoninfo(index).then((value) {
      setState(() {
        pokemonstat = value.list as List<Stat>;
      });
    }).catchError((onError) {
      setState(() {
        erroMensseger = 'Deu erro aqui $onError';
      });
    });
  }

  getlocalpoke(id) {
    PokemonServices().gettypepokelocalizatio(id).then((value) {
      setState(() {
        localization = value.list as List<LocationArea>;
      });
    }).catchError((onError) {
      setState(() {
        msg = "DEU ERRO E FOI ISSO>>> $onError";
      });
    });
  }

  transition() {
    Future.delayed(const Duration(seconds: 2)).then((value) => {
          setState(() {
            leading = false;
          }),
        });
  }

  @override
  void initState() {
    getpokeinfo(index: widget.id);
    validatelist(widget.nextEvolution, widget.prevEvolution);
    getlocalpoke(widget.id);
    transition();

    super.initState();
  }

//
//
//

  validatelist(
    List next,
    List prev,
  ) {
    if (prev.isEmpty) {
      setState(() {
        evolutions = next;
      });
    } else {
      setState(() {
        evolutions = prev;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return leading
        ? Container(
            color: Colors.white,
            child: Center(
                child: CircularProgressIndicator(
              color: Backgroud()
                  .getBackgroudType(type: widget.types[0].toString()),
            )),
          )
        : Scaffold(
            body: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                ),
                ClipPath(
                  clipper: CustomPath(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.46,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Backgroud()
                          .getBackgroudType(type: widget.types[0].toString()),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.09,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Colors.white,
                                  size: 30,
                                )),
                            const Text(
                              'Pokedex',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            widget.name,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.1,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                fontFamily: 'BebasNeue'),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                          Text('#${widget.id.toString()}',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.1,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black.withOpacity(0.4),
                                  fontFamily: 'PatuaOne'))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.33,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: widget.types
                                    .map((e) => TypelistDetails(pokemon: e))
                                    .toList(),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height:
                                  MediaQuery.of(context).size.height * 0.441,
                              child: PageView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  SizedBox(
                                    child: Column(
                                      children: [
                                        InfopokeWidget(
                                          height: widget.height,
                                          name: widget.name,
                                          types: widget.types,
                                          width: widget.width,
                                        ),
                                        SecundariinfopokeWidget(
                                          candy: widget.candy,
                                          type: widget.types,
                                          localization: localization.isEmpty
                                              ? 'Evolução'
                                              : Localepokemon().localpokemon(
                                                  city: localization[0]
                                                      .name
                                                      .toString()),
                                        ),
                                        EvolutionPokemonWidget(
                                          evolutions: evolutions,
                                          id: widget.id,
                                          types: widget.types,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text('Status Base'.toUpperCase(),
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05,
                                              fontWeight: FontWeight.w900,
                                              color: Backgroud()
                                                  .getBackgroudType(
                                                      type: widget.types[0]),
                                              fontFamily: 'Nunito')),
                                      Expanded(
                                        child: ListView.builder(
                                            itemCount: pokemonstat.length,
                                            itemBuilder: (context, index) {
                                              return PokeStats(
                                                  types: widget.types,
                                                  nameStats: pokemonstat[index]
                                                      .stat!
                                                      .name
                                                      .toString(),
                                                  statsPower: pokemonstat[index]
                                                      .baseStat!);
                                            }),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                  right: 20,
                  top: 140,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Opacity(
                          opacity: 0.2,
                          child: Text(
                            widget.name.toUpperCase(),
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.15,
                              color: Colors.white,
                              fontFamily: 'Goldendragon',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  left: 10,
                  top: 80,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                GifimagePokemon().getimag(widget.name)),
                            scale: 0.5)),
                  ),
                )
              ],
            ),
          );
  }
}
