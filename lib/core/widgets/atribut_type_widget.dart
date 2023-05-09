import 'package:flutter/material.dart';
import 'package:pokedexx/core/theme/backgroud_color.dart';
import 'package:pokedexx/core/theme/traduct_type_poker.dart';

class AtributTypeWidget extends StatelessWidget {
  final String typename;

  const AtributTypeWidget({Key? key, required this.typename}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.071,
      decoration: BoxDecoration(
          color: Backgroud().getBackgroudType(type: typename),
          borderRadius: BorderRadius.circular(22)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.11,
              height: MediaQuery.of(context).size.height * 0.071,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        'assets/img/icons/$typename.png',
                      ))),
            ),
          ),
          Text(
            TraductTypePoker().traducttype(typepoke: typename),
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.06,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                fontFamily: 'Nunito'),
          ),
        ],
      ),
    );
  }
}
