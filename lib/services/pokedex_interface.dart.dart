import '../model/pokev2model.dart';

abstract class PokedexInterface {
  //metodo que pegar todos os pokemon
  // Future<ReturnApiList> getpokemon();
  Future<ReturnApiList> gettypepokemoninfo(int id);
  Future<ReturnApiList> gettypepokelocalizatio(int id);
  Future<ReturnApiList> gettypepokeevolution(int id);
  Future<ReturnApiList> getpokegeration(int index);
  Future<PokemonreturnV2> getpokemons(String url);
  Future<PokemonreturnV2> getpokemonforgeration(List geration, int pointstart);
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
  final List<Type> types;

  PokemonreturnV2(
      {required this.types, required this.pokemon, required this.erro});
}
