// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pokedexx/core/theme/backgroud_color.dart';
import 'package:pokedexx/core/widgets/listtype.dart';

class Pokemoncard extends StatefulWidget {
  const Pokemoncard({
    Key? key,
    required this.name,
    required this.type,
    required this.id,
    required this.img,
    required this.onPressed(),
  }) : super(key: key);

  @override
  State<Pokemoncard> createState() => _PokemoncardState();
  final String name;
  final List type;
  final String id;
  final String img;
  final Function() onPressed;
}

class _PokemoncardState extends State<Pokemoncard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: widget.onPressed,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.26,
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Backgroud().getBackgroudColor(
                                  type: widget.type[0].toString()),
                              borderRadius: BorderRadius.circular(10)),
                          height: MediaQuery.of(context).size.height * 0.22,
                          width: MediaQuery.of(context).size.width * 0.90,
                        ),
                        Positioned(
                          left: 120,
                          child: SizedBox(
                            child: InkWell(
                              onTap: widget.onPressed,
                              child: Opacity(
                                  opacity: 0.3,
                                  child: Image.asset(
                                    'assets/img/pokeBall.png',
                                    scale: 2.0,
                                  )),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          height: MediaQuery.of(context).size.height * 0.20,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text('#${widget.id}',
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                              fontFamily: 'PatuaOne')),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(widget.name,
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.08,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontFamily: 'BebasNeue')),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: widget.type
                                            .map((e) => Listtype(pokemon: e))
                                            .toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: 185,
              bottom: 25,
              child: widget.img == ''
                  ? Image.asset(
                      'assets/img/pokeLoad.gif',
                      scale: 0.3,
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.24,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.img, scale: 0.8)),
                      ),
                    ),
            ),
          ],
        ),
      ],
    );
  }
}

//==cpntainer d ecor do pokemon
// Container(
//                   decoration: BoxDecoration(
//                       color: Backgroud()
//                           .GetBackgroudColor(type: widget.type[0].toString()),
//                       borderRadius: BorderRadius.circular(10)),
//                   height: MediaQuery.of(context).size.height * 0.20,
//                   width: MediaQuery.of(context).size.width * 0.95,
//                   child: Stack(children: []),
//                 )

//pokemon



//===================poke type============
// Container(
//                                     alignment: Alignment.centerLeft,
//                                     child: Container(
//                                       width: 50,
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           color: Colors.grey[700]!
//                                               .withOpacity(0.6)),
//                                       alignment: Alignment.center,
//                                       child: Text(
//                                         widget.type[0].toString(),
//                                         style: TextStyle(
//                                             fontSize: MediaQuery.of(context)
//                                                     .size
//                                                     .width *
//                                                 0.03,
//                                             fontWeight: FontWeight.w400,
//                                             color: Colors.white),
//                                       ),
//                                     ),
                                  