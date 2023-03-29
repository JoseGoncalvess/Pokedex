import 'package:flutter/material.dart';
import 'package:pokedexx/core/theme/backgroud_color.dart';
import 'package:pokedexx/core/widgets/infopoke_widget.dart';
import 'package:pokedexx/pages/details_page/detailstype_poker.dart';
import '../core/helpers/clip_container.dart';
import '../core/widgets/secundari_infopoke_widget.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
    required this.name,
    required this.types,
    required this.id,
    required this.img,
    required this.width,
    required this.height,
    required this.candy,
  }) : super(key: key);

  final String name;
  final List<String> types;
  final int id;
  final String img;
  final String width;
  final String height;
  final String candy;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
          ),
          ClipPath(
            clipper: CustomPath(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.46,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Backgroud()
                    .getBackgroudType(type: widget.types[0].toString()),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                      Text(
                        'Pokedex',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.06,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.1,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontFamily: 'BebasNeue'),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                    Text('#${widget.id.toString()}',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.1,
                            fontWeight: FontWeight.w900,
                            color: Colors.black.withOpacity(0.4),
                            fontFamily: 'PatuaOne'))
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.33,
              ),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.types
                          .map((e) => TypelistDetails(pokemon: e))
                          .toList(),
                    ),
                  ),
                  InfopokeWidget(
                    height: widget.height,
                    name: widget.name,
                    types: widget.types,
                    width: widget.width,
                  ),
                  SecundariinfopokeWidget(
                    candy: widget.candy,
                    type: widget.types,
                    localization: '',
                  )
                ],
              )
            ],
          ),
          Positioned(
            right: 20,
            top: 140,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Opacity(
                    opacity: 0.08,
                    child: Text(
                      widget.name.toUpperCase(),
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.15,
                        color: Colors.white,
                        fontFamily: 'Goldendragon',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 10,
            left: 10,
            top: 80,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.img), scale: 0.5)),
            ),
          )
        ],
      ),
    );
  }
}
