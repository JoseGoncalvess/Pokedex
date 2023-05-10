class LinksBase {
  String vekuum =
      'https://veekun.com/dex/media/pokemon/main-sprites/omegaruby-alphasapphire/20.png';
  String serebi = 'https://www.serebii.net/pokemongo/pokemon/10.png";';

  linkbasegeration(int index) {
    String geration = 'https://pokeapi.co/api/v2/pokemon?offset=151&limit=100';
    if (index == 1) {
      geration = 'https://pokeapi.co/api/v2/pokemon?offset=0&limit=151';
    } else if (index == 2) {
      geration = 'https://pokeapi.co/api/v2/pokemon?offset=151&limit=100';
    } else if (index == 3) {
      geration = 'https://pokeapi.co/api/v2/pokemon?offset=252&limit=135';
    } else if (index == 4) {
      geration = 'https://pokeapi.co/api/v2/pokemon?offset=386&limit=106';
    } else if (index == 5) {
      geration = 'https://pokeapi.co/api/v2/pokemon?offset=494&limit=155';
    } else if (index == 6) {
      geration = 'https://pokeapi.co/api/v2/pokemon?offset=649&limit=71';
    } else if (index == 7) {
      geration = 'https://pokeapi.co/api/v2/pokemon?offset=721&limit=87';
    } else if (index == 8) {
      geration = 'https://pokeapi.co/api/v2/pokemon?offset=809&limit=87';
    }
    return geration;
  }
}





//geracão: 1 Kanton = 0 a 151
//geracão: 2 Johto  = 151 a 251 = + 100
//geracão: 3 Hoenn  = 252 a 386 = + 135
//geracão: 4 Sinnoh = 386 a 493 = + 106
//geracão: 5 Unova  = 494 a 649 = + 155
//geracão: 6 kalos  = 650 a 721 = + 71
//geracão: 7 Alola  = 722 a 809 = + 87
//geracão: 8 Galar/Hisui = 810 a 905 = + 95