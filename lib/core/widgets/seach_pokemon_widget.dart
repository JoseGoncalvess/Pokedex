import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pokedexx/model/pokev2model.dart';
import 'package:pokedexx/model/pokev2model.dart';
import '../custons/custonseachdelegate.dart';

class SeachPokemonWidget extends StatefulWidget {
  const SeachPokemonWidget({
    super.key,
    required this.allPoker,
    required this.pokenames,
  });
  final List<Pokemon> allPoker;
  final List<String> pokenames;

  @override
  State<SeachPokemonWidget> createState() => _SeachPokemonWidgetState();
}

class _SeachPokemonWidgetState extends State<SeachPokemonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () => showSearch(
                context: context,
                delegate: Custonseachdelegate(
                  onPressed: () {
                    log('Pegou');
                  },
                )),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.9)),
                  color: Colors.white.withOpacity(1),
                  borderRadius: BorderRadius.circular(22)),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.search_rounded,
                      size: 30,
                    ),
                    color: Colors.grey.withOpacity(0.6),
                    onPressed: () {
                      // log(widget.allPoker.length.toString());
                      // log(widget.pokenames.length.toString());
                      showSearch(
                          context: context,
                          delegate: Custonseachdelegate(
                            onPressed: () {
                              log('Pegou');
                            },
                          ));
                    },
                  ),
                  Flexible(
                      child: Text(
                    'Digite o nome do Pokémon',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.023,
                        color: Colors.black.withOpacity(0.5),
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w700),
                  ))
                ],
              ),
            ),
          )),
    );
  }
}
