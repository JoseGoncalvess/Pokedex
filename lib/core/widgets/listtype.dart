// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pokedexx/core/theme/backgroud_color.dart';
import 'package:pokedexx/core/theme/traduct_type_poker.dart';
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
      padding: const EdgeInsets.all(2.0),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.17,
        height: MediaQuery.of(context).size.height * 0.02,
        decoration: BoxDecoration(
            color: Backgroud()
                .getBackgroudColor(type: widget.pokemon.toLowerCase()),
            borderRadius: BorderRadius.circular(3)),
        child: Padding(
            padding: const EdgeInsets.only(left: 1.0),
            child: Text(
              TraductTypePoker()
                  .traducttype(typepoke: widget.pokemon.toLowerCase()),
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.025,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontFamily: 'Nunito'),
            )),
      ),
    );
  }
}
