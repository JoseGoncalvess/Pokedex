import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:pokedexx/core/widgets/pokemoncard.dart';
import 'package:pokedexx/model/pokeModel.dart';
import 'package:pokedexx/model/pokemon_model_v2.dart';
import 'package:pokedexx/model/spaw_pokemon.dart';
import 'package:pokedexx/services/pokedex_interface.dart.dart';

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
    }

    return ReturnApiList(list: localization, msg: 'ops');
  }
}
