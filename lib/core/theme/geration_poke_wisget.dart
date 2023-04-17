import 'dart:developer';

class GerationPokeWisget {
  Future<GerationWidget> getgerationwidget(int number) async {
    String img = '';
    String geration = '';
    String region = '';
    int index = 0;

    List<Itemgertion> gerations = [];
    for (var i = 1; i < number; i++) {
      if (i == 1) {
        geration = 'Geração 1';
        img = 'assets/img/Gpokemon/G1.png';
        region = 'Kanton';
        index = 1;
      } else if (i == 2) {
        geration = 'Geração 2';
        img = 'assets/img/Gpokemon/G2.png';
        region = 'Johto';
        index = 2;
      } else if (i == 3) {
        geration = 'Geração 3';
        img = 'assets/img/Gpokemon/G3.png';
        region = 'Hoenn';
        index = 3;
      } else if (i == 4) {
        geration = 'Geração 4';
        img = 'assets/img/Gpokemon/G4.png';
        region = 'Sinnoh';
        index = 4;
      } else if (i == 5) {
        geration = 'Geração 5';
        img = 'assets/img/Gpokemon/G5.png';
        region = 'Unova';
        index = 5;
      } else if (i == 6) {
        geration = 'Geração 6';
        img = 'assets/img/Gpokemon/G6.png';
        region = 'kalos';
        index = 6;
      } else if (i == 7) {
        geration = 'Geração 7';
        img = 'assets/img/Gpokemon/G7.png';
        region = 'Alola';
        index = 7;
      } else if (i == 8) {
        geration = 'Geração 8';
        img = 'assets/img/Gpokemon/G8.png';
        region = 'Galar/Hisui';
        index = 8;
      }
      log(Itemgertion(
              geration: geration, region: region, img: img, index: index)
          .toString());
      gerations.add(Itemgertion(
        index: index,
        geration: geration,
        region: region,
        img: img,
      ));
    }

    return GerationWidget(geration: gerations);
  }
}

class Itemgertion {
  final String img;
  final String geration;
  final String region;
  final int index;
  Itemgertion({
    required this.img,
    required this.geration,
    required this.region,
    required this.index,
  });
}

class GerationWidget {
  final List<Itemgertion> geration;
  GerationWidget({
    required this.geration,
  });
}
