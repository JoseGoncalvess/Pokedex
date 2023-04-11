import 'package:flutter/material.dart';

class PokemonGerationWidget extends StatefulWidget {
  const PokemonGerationWidget(
      {Key? key,
      required this.region,
      required this.geration,
      required this.img})
      : super(key: key);

  final String region;
  final String geration;
  final String img;

  @override
  State<PokemonGerationWidget> createState() => _PokemonGerationWidgetState();
}

class _PokemonGerationWidgetState extends State<PokemonGerationWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 10,
                  blurStyle: BlurStyle.outer),
            ]),
        height: MediaQuery.of(context).size.height * 0.34,
        width: MediaQuery.of(context).size.width * 0.01,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              widget.geration.toUpperCase(),
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w800,
                  color: Colors.grey[700],
                  fontSize: MediaQuery.of(context).size.height * 0.02),
            ),
          ),
          Image.asset(widget.img),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Região: ',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w800,
                    color: Colors.grey.withOpacity(0.5),
                    fontSize: MediaQuery.of(context).size.height * 0.02),
              ),
              Text(
                widget.region,
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w800,
                    color: Colors.grey[700],
                    fontSize: MediaQuery.of(context).size.height * 0.02),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
