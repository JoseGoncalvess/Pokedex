import '../model/pokev2model.dart';

abstract class PokedexInterface {
  //metodo que pegar todos os pokemon
  Future<ReturnApiList> gettypepokemoninfo(int id);
  Future<ReturnApiList> gettypepokelocalizatio(int id);
  Future getpokeSpecie({required String pokename});
  Future<ReturnApiList> gettypepokeevolution({required String pokename});
  Future<ReturnApiList> getpokegeration(int index);
  Future<PokemonreturnV2> getpokemons(String url);
  Future<PokemonreturnV2> getpokemonforgeration(List geration, int pointstart);
  Future<PokemonreturnV2> getpokemonforgerationstart(
      List geration, int pointstart);
  Future<Pokemon> seachpokemon(String poke);
  Future<Pokemon> completlistpokemon({required int poke});
  Future<PokeV2outherinfo> outhernfopoke({required String index});
}

class ReturnApiList {
  // recebo uma lsita do tipo do meu modelo
  final List<dynamic> list;
  //menssagem em caso de erro
  final String msg;

  ReturnApiList({
    required this.list,
    required this.msg,
  });
}

class PokemonreturnV2 {
  final dynamic pokemon;
  final String erro;

  PokemonreturnV2({required this.pokemon, required this.erro});
}
