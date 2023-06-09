import 'package:flutter/material.dart';
import 'custons/custonseachdelegate.dart';

class SeachPokemonWidget extends StatefulWidget {
  const SeachPokemonWidget({
    super.key,
  });

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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Custonseachdelegate(),
                  ));
            },
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
                    color: Colors.red.withOpacity(0.8),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Custonseachdelegate(),
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
