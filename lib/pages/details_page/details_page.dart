import 'package:flutter/material.dart';
import 'package:pokedexx/core/theme/backgroud_color.dart';
import 'package:pokedexx/core/widgets/infopoke_widget.dart';
import 'package:pokedexx/model/atributi_type_model.dart';
import 'package:pokedexx/pages/details_page/detailstype_poker.dart';
import '../../core/helpers/clip_container.dart';
import '../../core/theme/gifimage_pokemon.dart';
import '../../core/theme/localepokemon.dart';
import '../../core/widgets/atribut_type_widget.dart';
import '../../core/widgets/evolution_pokemon_widget.dart';
import '../../core/widgets/poke_stats.dart';
import '../../core/widgets/secundari_infopoke_widget.dart';
import '../../model/location_poke_area.dart';
import '../../model/poke_evolution.dart';
import '../../model/pokev2model.dart';
import '../../services/pokemon_services.dart';

class DetailsPage extends StatefulWidget {
  final String name;
  final List<Type> types;
  final int id;

  const DetailsPage({
    Key? key,
    required this.name,
    required this.types,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String weight = '';
  String height = '';
  List<Stat> pokemonstat = [];
  String erroMensseger = '';
  bool leading = true;
  List<PokeEvolution> evolutions = [];
  List<LocatioArea> localization = [];
  List<AtributsType> atributo = [];
  List<String> vantagem = [];
  List<String> desvantagem = [];
  String msg = '';

//retorna todas a infomrações sobre pokemons
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

  getatributos({required String typename}) {
    PokemonServices().getartributs(type: typename).then(
          (value) => {
            setState(() {
              vantagem = value.vantagem!;
              desvantagem = value.desvantagem!;
            })
          },
        );
  }

  outhernfopoke({required String i}) {
    PokemonServices().outhernfopoke(index: i).then((value) => {
          setState(() {
            weight = (value.weight! / 10).toString();
            height = (value.height! / 10).toString();
          })
        });
  }

//retorna local do pokemon
  getlocalpoke(id) {
    PokemonServices().gettypepokelocalizatio(id).then((value) {
      setState(() {
        localization = value.list as List<LocatioArea>;
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

  evolutionspoke({required int id}) {
    PokemonServices()
        .gettypepokeevolution(pokename: widget.name)
        .then((value) => {
              setState(() {
                evolutions = value.list as List<PokeEvolution>;
              })
            });
  }

  @override
  void initState() {
    outhernfopoke(i: widget.id.toString());
    evolutionspoke(id: widget.id);
    getpokeinfo(index: widget.id);
    getlocalpoke(widget.id);
    transition();
    getatributos(typename: widget.types[0].type.name);

    super.initState();
  }

//
//
//

  @override
  Widget build(BuildContext context) {
    return leading
        ? Container(
            color: Colors.white,
            child: Center(
                child: CircularProgressIndicator(
              color: Backgroud()
                  .getBackgroudType(type: widget.types[0].type.name.toString()),
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
                      color: Backgroud().getBackgroudType(
                          type: widget.types[0].type.name.toString()),
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
                      height: MediaQuery.of(context).size.height * 0.05,
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
                      height: MediaQuery.of(context).size.height * 0.25,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.59,
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
                                    .map((e) =>
                                        TypelistDetails(pokemon: e.type.name))
                                    .toList(),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.54,
                              child: PageView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    SizedBox(
                                      child: Column(
                                        children: [
                                          InfopokeWidget(
                                            height: height,
                                            name: widget.name,
                                            types: widget.types,
                                            width: weight,
                                          ),
                                          SecundariinfopokeWidget(
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
                                    SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        children: [
                                          Text(
                                            'Poke Status',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.06,
                                                fontWeight: FontWeight.w900,
                                                color: Backgroud()
                                                    .getBackgroudType(
                                                        type: widget
                                                            .types[0].type.name
                                                            .toString()),
                                                fontFamily: 'Nunito'),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.332,
                                            child: ListView.builder(
                                              itemCount: pokemonstat.length,
                                              itemBuilder: (context, index) =>
                                                  PokeStats(
                                                      types: widget.types,
                                                      nameStats:
                                                          pokemonstat[index]
                                                              .stat!
                                                              .name,
                                                      statsPower:
                                                          pokemonstat[index]
                                                              .baseStat!),
                                            ),
                                          ),
                                          Text(
                                            'Vantagem',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.06,
                                                fontWeight: FontWeight.w900,
                                                color: Backgroud()
                                                    .getBackgroudType(
                                                        type: widget
                                                            .types[0].type.name
                                                            .toString()),
                                                fontFamily: 'Nunito'),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.06,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: vantagem.length,
                                              itemBuilder: (context, index) =>
                                                  AtributTypeWidget(
                                                      typename:
                                                          vantagem[index]),
                                            ),
                                          ),
                                          Text(
                                            'Desvantagem',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.06,
                                                fontWeight: FontWeight.w900,
                                                color: Backgroud()
                                                    .getBackgroudType(
                                                        type: widget
                                                            .types[0].type.name
                                                            .toString()),
                                                fontFamily: 'Nunito'),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.06,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: desvantagem.length,
                                              itemBuilder: (context, index) =>
                                                  AtributTypeWidget(
                                                      typename:
                                                          desvantagem[index]),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
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
                  top: 50,
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