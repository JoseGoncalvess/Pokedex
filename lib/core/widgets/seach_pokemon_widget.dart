import 'dart:developer';

import 'package:flutter/material.dart';

import '../../model/pokeModel.dart';
import '../../services/pokemon_services.dart';
import '../custons/custonseachdelegate.dart';

class SeachPokemonWidget extends StatefulWidget {
  SeachPokemonWidget(
      {super.key, required this.allPoker, required this.pokenames});
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
                          searchtermrd: widget.pokenames,
                          poemons: widget.allPoker,
                          onPressed: () {
                            log('Pegou');
                          },
                        ));
                  },
                ),
              ],
            ),
          )),
    );
  }
}








        //     TextField(
        //   keyboardType: TextInputType.name,
        //   maxLines: 2,
        //   textAlign: TextAlign.justify,
        //   decoration: InputDecoration(
        //     // prefixIcon:
        //     filled: true,
        //     fillColor: Colors.white,
        //     hintText: 'Digite aqui o nome do Pokémon',
        //     hintStyle: TextStyle(
        //       color: Colors.grey.withOpacity(0.6),
        //       fontSize: MediaQuery.of(context).size.height * 0.02,
        //       fontWeight: FontWeight.w800,
        //       fontFamily: 'Nunito',
        //     ),
        //     border: const OutlineInputBorder(
        //       borderSide: BorderSide(
        //         color: Color.fromARGB(173, 158, 158, 158),
        //       ),
        //       borderRadius: BorderRadius.all(
        //         Radius.circular(22),
        //       ),
        //     ),
        //     focusedBorder: const OutlineInputBorder(
        //         borderRadius: BorderRadius.all(
        //           Radius.circular(22),
        //         ),
        //         borderSide: BorderSide(
        //           color: Color.fromARGB(173, 158, 158, 158),
        //         )),
        //   ),
        // ),