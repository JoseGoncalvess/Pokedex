import 'package:flutter/material.dart';

class ErrorSearchPokeWidget extends StatelessWidget {
  const ErrorSearchPokeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/img/pokeLoad.gif'))),
              ),
              Text(
                'Pokémon não Encontrado',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Nunito'),
              ),
              Text(
                'Verifique se o nome está Correto ou Tsente procurar pela #',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: MediaQuery.of(context).size.height * 0.022,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Nunito'),
              )
            ],
          )),
    );
  }
}
