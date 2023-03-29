// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pokedexx/core/theme/backgroud_color.dart';
import 'package:pokedexx/core/widgets/listtype.dart';
import '../core/widgets/poke_stats.dart';
import '../model/pokemon_model_v2.dart';
import '../services/pokemon_services.dart';

class Detailpoker extends StatefulWidget {
  const Detailpoker({
    Key? key,
    required this.name,
    required this.type,
    required this.id,
    required this.img,
  }) : super(key: key);
  final String name;
  final List type;
  final String id;
  final String img;

  @override
  State<StatefulWidget> createState() {
    return _DetailpokerState();
  }
}

class _DetailpokerState extends State<Detailpoker> {
  List<Stat> pokemonstat = [];
  String erroMensseger = '';

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

  @override
  void initState() {
    getpokeinfo(index: int.parse(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50)),
                    color: Backgroud().getBackgroudColor(type: widget.type[0])),
                child: Stack(
                  children: [
                    Positioned(
                        left: 5,
                        bottom: 200,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Opacity(
                                opacity: 0.13,
                                child: Text(
                                  widget.name.toUpperCase(),
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.15,
                                    color: Colors.white,
                                    fontFamily: 'Goldendragon',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    Positioned(
                        bottom: 15,
                        left: 300,
                        child: Opacity(
                          opacity: 0.3,
                          child: Image.asset(
                            'assets/img/bolhas.png',
                            scale: 1.8,
                          ),
                        )),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.topLeft,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_rounded,
                                size: 25,
                                color: Colors.white,
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.30,
                          width: MediaQuery.of(context).size.width,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.20,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                widget.img == ''
                                    ? Image.asset(
                                        'assets/img/pokeLoad.gif',
                                        scale: 0.5,
                                      )
                                    : Image.network(
                                        widget.img,
                                        scale: 0.5,
                                      ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(widget.name.toUpperCase(),
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.08,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'BebasNEue',
                                            color: Colors.white)),
                                    SizedBox(
                                      child: Column(
                                        children: widget.type
                                            .map((e) => Listtype(pokemon: e))
                                            .toList(),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(),
                              Text('STATUS',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white)),
                              Text('EVOLUÇÕES',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: 'Nunito',
                                      color: Colors.white))
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Text('Status'.toUpperCase(),
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Nunito',
                            color: const Color.fromARGB(255, 77, 77, 77)))
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: pokemonstat.length,
                          itemBuilder: (context, index) {
                            return PokeStats(
                                types: widget.type,
                                nameStats: pokemonstat[index].stat.name,
                                statsPower: pokemonstat[index].baseStat);
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
