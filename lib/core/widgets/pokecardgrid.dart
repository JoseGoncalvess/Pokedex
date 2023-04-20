import 'package:flutter/material.dart';
import 'package:pokedexx/core/theme/backgroud_color.dart';
import 'package:pokedexx/core/widgets/listtype.dart';
import 'package:pokedexx/model/pokev2model.dart';

import '../theme/gifimage_pokemon.dart';

class Pokecardgrid extends StatefulWidget {
  const Pokecardgrid({
    super.key,
    required this.name,
    required this.type,
    required this.id,
    required this.img,
    required this.onPressed,
  });

  @override
  State<Pokecardgrid> createState() => _PokecardgridState();
  final String name;
  final List<Type> type;
  final String id;
  final String img;
  final Function() onPressed;
}

class _PokecardgridState extends State<Pokecardgrid> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Backgroud()
                        .getBackgroudColor(type: widget.type[0].type.name),
                    blurRadius: 3,
                    spreadRadius: 1)
              ],
              color:
                  Backgroud().getBackgroudType(type: widget.type[0].type.name)),
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width * 0.5,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: Text(widget.name,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.06,
                                fontFamily: 'BebasNeue',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                        ),
                        Text('#${widget.id}',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.06,
                              fontWeight: FontWeight.w900,
                              fontFamily: "PatuaOne",
                              color: Colors.black.withOpacity(0.4),
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                            children: widget.type
                                .map((e) => Listtype(pokemon: e.type.name))
                                .toList())
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 75,
                right: 60,
                child: SizedBox(
                  child: Opacity(
                      opacity: 0.3,
                      child: Image.asset(
                        'assets/img/pokeBall.png',
                        scale: 3.0,
                      )),
                ),
              ),
              Positioned(
                left: 12,
                top: 70,
                child: widget.img == ''
                    ? Image.asset(
                        'assets/img/pokeLoad.gif',
                        scale: 0.5,
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width * 0.29,
                        height: MediaQuery.of(context).size.height * 0.13,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: NetworkImage(
                                  GifimagePokemon().getimag(widget.name),
                                ))),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
