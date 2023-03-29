// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pokedexx/core/theme/backgroud_color.dart';
import 'package:pokedexx/model/pokemodel.dart';
import '../../services/pokemon_services.dart';

class Listtype extends StatefulWidget {
  const Listtype({
    Key? key,
    required this.pokemon,
  }) : super(key: key);
  final String pokemon;
  @override
  State<Listtype> createState() => _ListtypeState();
}

class _ListtypeState extends State<Listtype> {
  List<Pokemon> poketipe = [];
  bool leading = true;
  String menssage = '';

  getpoke() {
    setState(() {
      leading = false;
    });
    PokemonServices().getpokemon().then((value) {
      setState(() {
        poketipe = value.list as List<Pokemon>;
        menssage = value.msg;
        setState(() {
          leading = true;
        });
      });
    }).catchError((onError) {
      menssage = "DEU ERRO E FOI ISSO>>> $onError";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        decoration: BoxDecoration(
            color: Backgroud().getBackgroudType(type: widget.pokemon),
            borderRadius: BorderRadius.circular(3)),
        child: Padding(
            padding: const EdgeInsets.only(left: 1.0),
            child: Text(
              widget.pokemon,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.023,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontFamily: 'Nunito'),
            )),
      ),
    );
  }
}
