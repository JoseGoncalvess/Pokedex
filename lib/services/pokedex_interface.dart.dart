// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class PokedexInterface {
  //metodo que pegar todos os pokemon
  Future<ReturnApiList> getpokemon();
  Future<ReturnApiList> gettypepokemoninfo(int id);
  Future<ReturnApiList> gettypepokelocalizatio(int id);
  Future<ReturnApiList> gettypepokeevolution(int id);
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
