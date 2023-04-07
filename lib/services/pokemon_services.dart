import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:pokedexx/model/pokeModel.dart';
import 'package:pokedexx/model/pokemon_model_v2.dart';
import 'package:pokedexx/model/spaw_pokemon.dart';
import 'package:pokedexx/services/pokedex_interface.dart.dart';
import '../model/evolutionmodel.dart';

class PokemonServices extends PokedexInterface {
  @override
  Future<ReturnApiList> getpokemon() async {
    final dio = Dio();
    List<Pokemon> list = [];

    String pokeUrl =
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

    var response = await dio.get(pokeUrl);

    if (response.statusCode == 200) {
      //transformo o json que retonrou da api em um formato json que é um map 'as"
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      //passo para aminha lista esse json passando a chave 'pokemon' pra ter acesso a lista
      final listpoke = json['pokemon'] as List<dynamic>;
      list = listpoke.map((e) => Pokemon.fromJson(e)).toList();
    }

    return ReturnApiList(list: list, msg: 'Não obtive os dados dos pokemons');
  }

//
//
//
  @override
  Future<ReturnApiList> gettypepokemoninfo(int id) async {
    final dio = Dio();
    List<Stat> listinfo = [];

    String baseUrl = 'https://pokeapi.co/api/v2/pokemon/$id';

    var response = await dio.get(baseUrl);
    if (response.statusCode == 200) {
      List liststatus = response.data['stats'];
      listinfo = liststatus.map((e) => Stat.fromJson(e)).toList();
      log(listinfo.toString());

      // listinfo = listAll.map((e) => PokemonV2.fromJson(e)).toList();

      log(listinfo[0].stat.name.toString());
    }

    return ReturnApiList(
        list: listinfo, msg: 'Erro ao buscar informações na api');
  }

//
//
//
  @override
  Future<ReturnApiList> gettypepokelocalizatio(int id) async {
    final dio = Dio();
    List<LocationArea> localization = [];

    String baseUrl = 'https://pokeapi.co/api/v2/pokemon/$id/encounters';
    var response = await dio.get(baseUrl);

    if (response.statusCode == 200) {
      var lista = response.data;

      for (var element in lista) {
        var item = LocationArea.fromJson(element['location_area']);

        localization.add(item);
      }
      // log(lista.toString());
    }

    return ReturnApiList(list: localization, msg: 'ops');
  }

//
//
//
  @override
  Future<ReturnApiList> gettypepokeevolution(int id) async {
    final dio = Dio();
    List<EvolutionDetail> evoluction = [];
    String evolut = 'https://pokeapi.co/api/v2/evolution-chain/$id/';
    var response = await dio.get(evolut);

    if (response.statusCode == 200) {
      var corpo = response.data['chain']['evolves_to'];

      for (var element in corpo) {
        for (var e in element['evolution_details']) {
          var item = EvolutionDetail.fromJson(e);
          evoluction.add(item);
        }
        // log(element['evolves_to'].toString());
      }
      // log(evoluction[0].minLevel.toString());
      // log(corpo.toString());
    }

    return ReturnApiList(
        list: evoluction, msg: 'erro ao buscar detalhes de evolução');
  }
}


//geracão: 1 Kanton = 0 a 151
//geracão: 2 Johto  = 151 a 251 = + 100
//geracão: 3 Hoenn  = 252 a 386 = + 135
//geracão: 4 Sinnoh = 387 a 493 = + 106
//geracão: 5 Unova  = 494 a 649 = + 155
//geracão: 6 kalos  = 650 a 721 = + 71
//geracão: 7 Alola  = 722 a 809 = + 87
//geracão: 8 Galar/Hisui = 810 a 905 = + 95