import 'dart:developer';

class GerationPokeWisget {
  Future<GerationWidget> getgerationwidget(int index) async {
    String img = '';
    String geration = '';
    String region = '';

    List<Itemgertion> gerations = [];
    for (var i = 1; i < index; i++) {
      if (i == 1) {
        geration = 'Geração 1';
        img = 'assets/img/Gpokemon/G1.png';
        region = 'Kanton';
      } else if (i == 2) {
        geration = 'Geração 2';
        img = 'assets/img/Gpokemon/G2.png';
        region = 'Johto';
      } else if (i == 3) {
        geration = 'Geração 3';
        img = 'assets/img/Gpokemon/G3.png';
        region = 'Hoenn';
      } else if (i == 4) {
        geration = 'Geração 4';
        img = 'assets/img/Gpokemon/G4.png';
        region = 'Sinnoh';
      } else if (i == 5) {
        geration = 'Geração 5';
        img = 'assets/img/Gpokemon/G5.png';
        region = 'Unova';
      } else if (i == 6) {
        geration = 'Geração 6';
        img = 'assets/img/Gpokemon/G6.png';
        region = 'kalos';
      } else if (i == 7) {
        geration = 'Geração 7';
        img = 'assets/img/Gpokemon/G7.png';
        region = 'Alola';
      } else if (i == 8) {
        geration = 'Geração 8';
        img = 'assets/img/Gpokemon/G8.png';
        region = 'Galar/Hisui';
      }
      // log(Itemgertion(geration: geration, region: region, img: img).toString());
      gerations.add(Itemgertion(geration: geration, region: region, img: img));
    }

    return GerationWidget(geration: gerations);
  }
}

class Itemgertion {
  final String img;
  final String geration;
  final String region;
  Itemgertion({
    required this.img,
    required this.geration,
    required this.region,
  });
}

class GerationWidget {
  final List<Itemgertion> geration;
  GerationWidget({
    required this.geration,
  });
}
