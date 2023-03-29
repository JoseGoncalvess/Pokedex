import 'package:flutter/material.dart';
import 'package:pokedexx/core/theme/traduct_type_poker.dart';

import '../theme/backgroud_color.dart';

class InfopokeWidget extends StatefulWidget {
  const InfopokeWidget(
      {required this.name,
      required this.types,
      required this.width,
      required this.height});
  final String name;
  final List<String> types;
  final String width;
  final String height;

  @override
  State<InfopokeWidget> createState() => _InfopokeWidgetState();
}

class _InfopokeWidgetState extends State<InfopokeWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.09,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.31,
            height: MediaQuery.of(context).size.height * 0.08,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(TraductTypePoker().traducttype(typepoke: widget.types[0]),
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.w900,
                        color: Backgroud()
                            .getBackgroudType(type: widget.types[0].toString()),
                        fontFamily: 'Nunito')),
                Text('Espécie'.toUpperCase(),
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey.withOpacity(0.5),
                        fontFamily: 'Nunito'))
              ],
            ),
          ),
          Container(
            color:
                Backgroud().getBackgroudType(type: widget.types[0].toString()),
            height: MediaQuery.of(context).size.height * 0.08,
            width: 2,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.31,
            height: MediaQuery.of(context).size.height * 0.08,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.height,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.w900,
                        color: Backgroud()
                            .getBackgroudType(type: widget.types[0].toString()),
                        fontFamily: 'Nunito')),
                Text('altura'.toUpperCase(),
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey.withOpacity(0.5),
                        fontFamily: 'Nunito'))
              ],
            ),
          ),
          Container(
            color:
                Backgroud().getBackgroudType(type: widget.types[0].toString()),
            height: MediaQuery.of(context).size.height * 0.08,
            width: 2,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.31,
            height: MediaQuery.of(context).size.height * 0.08,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.height,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.w900,
                        color: Backgroud()
                            .getBackgroudType(type: widget.types[0].toString()),
                        fontFamily: 'Nunito')),
                Text('altura'.toUpperCase(),
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey.withOpacity(0.5),
                        fontFamily: 'Nunito'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
