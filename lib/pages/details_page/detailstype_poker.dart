import 'package:flutter/material.dart';
import 'package:pokedexx/core/theme/backgroud_color.dart';
import 'package:pokedexx/core/theme/traduct_type_poker.dart';
import 'package:pokedexx/model/pokemodel.dart';
import '../../services/pokemon_services.dart';

class TypelistDetails extends StatefulWidget {
  const TypelistDetails({
    Key? key,
    required this.pokemon,
  }) : super(key: key);
  final String pokemon;
  @override
  State<TypelistDetails> createState() => _TypelistDetailsState();
}

class _TypelistDetailsState extends State<TypelistDetails> {
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
      padding: const EdgeInsets.all(5.0),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.04,
        decoration: BoxDecoration(
            color: Backgroud().getBackgroudType(type: widget.pokemon),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(
              TraductTypePoker().traducttype(typepoke: widget.pokemon),
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontFamily: 'Nunito'),
            )),
      ),
    );
  }
}
