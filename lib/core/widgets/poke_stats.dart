// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pokedexx/core/theme/backgroud_color.dart';
import 'package:pokedexx/model/pokev2model.dart';

class PokeStats extends StatefulWidget {
  const PokeStats({
    Key? key,
    required this.types,
    required this.nameStats,
    required this.statsPower,
  }) : super(key: key);

  final List<Type> types;
  final String nameStats;
  final int statsPower;

  @override
  State<PokeStats> createState() => _PokeStatsState();
}

class _PokeStatsState extends State<PokeStats> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.04,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.01,
          ),
          Container(
              alignment: Alignment.centerLeft,
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.2,
              child: Text(
                widget.nameStats.toUpperCase(),
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w900,
                    color: Colors.grey[400]),
              )),
          Container(
            color:
                Backgroud().getBackgroudType(type: widget.types[0].type.name),
            width: MediaQuery.of(context).size.width * 0.004,
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Text(
            widget.statsPower.toString(),
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.03,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w900,
                color: Colors.grey[700]),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.08,
          ),
          Flexible(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 8,
              child: LinearProgressIndicator(
                  backgroundColor: const Color.fromARGB(155, 150, 148, 148),
                  color: Backgroud()
                      .getBackgroudColor(type: widget.types[0].type.name),
                  value: widget.statsPower / 100),
            ),
          )
        ],
      ),
    );
  }
}
