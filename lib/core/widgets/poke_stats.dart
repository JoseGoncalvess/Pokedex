// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pokedexx/core/theme/backgroud_color.dart';

class PokeStats extends StatefulWidget {
  const PokeStats({
    Key? key,
    required this.types,
    required this.nameStats,
    required this.statsPower,
  }) : super(key: key);

  final List types;
  final String nameStats;
  final int statsPower;

  @override
  State<PokeStats> createState() => _PokeStatsState();
}

class _PokeStatsState extends State<PokeStats> {
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        // color: Colors.grey,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.05,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.01,
            ),
            Container(
                alignment: Alignment.centerLeft,
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.2,
                child: Text(
                  widget.nameStats.toUpperCase(),
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w900,
                      color: Colors.grey[400]),
                )),
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
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 8,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: LinearProgressIndicator(
                    backgroundColor: Color.fromARGB(155, 150, 148, 148),
                    color: Backgroud()
                        .getBackgroudColor(type: widget.types[0].toString()),
                    value: widget.statsPower / 100),
              ),
            )
          ],
        ),
      ),
    );
  }
}
