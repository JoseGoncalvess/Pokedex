import 'package:flutter/material.dart';

class SeachPokemonWidget extends StatefulWidget {
  const SeachPokemonWidget({super.key});

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
        child: TextField(
          keyboardType: TextInputType.name,
          maxLines: 2,
          textAlign: TextAlign.justify,
          decoration: InputDecoration(
            prefixIcon: IconButton(
              icon: const Icon(
                Icons.search_rounded,
                size: 30,
              ),
              color: Colors.grey.withOpacity(0.6),
              onPressed: () {},
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Digite aqui o nome do Pokémon',
            hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.6),
              fontSize: MediaQuery.of(context).size.height * 0.02,
              fontWeight: FontWeight.w800,
              fontFamily: 'Nunito',
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(173, 158, 158, 158),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(22),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(22),
                ),
                borderSide: BorderSide(
                  color: Color.fromARGB(173, 158, 158, 158),
                )),
          ),
        ),
      ),
    );
  }
}
