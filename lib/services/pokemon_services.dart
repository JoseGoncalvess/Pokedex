import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pokedexx/model/evolutionmodel.dart';
import 'package:pokedexx/model/pokev2model.dart';
import 'package:pokedexx/model/spaw_pokemon.dart';
import 'package:pokedexx/services/pokedex_interface.dart.dart';
import '../core/theme/links_base.dart';
import '../model/gerationpomeon_model.dart';
import '../model/poke_evolution.dart';

class PokemonServices extends PokedexInterface {
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
    }

    return ReturnApiList(list: localization, msg: 'ops');
  }

//
//
//
  @override
  Future<ReturnApiList> gettypepokeevolution(int id) async {
    final dio = Dio();
    List<PokeEvolution> evolutions = [];
    String evolut = 'https://pokeapi.co/api/v2/evolution-chain/$id/';
    var response = await dio.get(evolut);

    if (response.statusCode == 200) {
      var corpo = response.data as Map<String, dynamic>;
      var c = Chain.fromJson(corpo['chain']);

      //TESTES DE INFOMRAÇÃO
//=================================================================================
      // log(corpo.toString());
      // log(c.speciess!.name.toString()); //priemira
      // log(c.evolvesTo![0].speciess!.name.toString()); //segunda eolution
      // log(c.evolvesTo![0].evolvesTo![0].speciess!.name
      //     .toString()); //primeira evolution
      // log('o 1 pokemon é ${c.speciess!.name.toString()} e o minimo pra evoluir é');
      // log('o 2  pokemon é ${c.evolvesTo![0].speciess!.name} e o minimo pra evoluir é${c.evolvesTo![0].evolutionDetails![0].minLevel}');
      // log('o 3  pokemon é ${c.evolvesTo![0].evolvesTo![0].speciess!.name} e o minimo pra evoluir é ${c.evolvesTo![0].evolvesTo![0].evolutionDetails![0].minLevel}');

//============================================================================
      evolutions.add(PokeEvolution(
          minLevel: c.evolvesTo![0].evolutionDetails![0].minLevel.toString(),
          pokename: c.evolvesTo![0].speciess!.name!));

      evolutions.add(PokeEvolution(
          minLevel: c.evolvesTo![0].evolvesTo![0].evolutionDetails![0].minLevel
              .toString(),
          pokename: c.evolvesTo![0].evolvesTo![0].speciess!.name!));
    }

    return ReturnApiList(list: evolutions, msg: 'Erro ao Buscar Evoluções');
  }

  @override
  Future<ReturnApiList> getpokegeration(int index) async {
    final dio = Dio();
    List<Result> geration = [];

    var response = await dio.get(LinksBase().linkbasegeration(index));
    if (response.statusCode == 200) {
      var corpo = response.data['results'];
      for (var poke in corpo) {
        var item = Result.fromJson(poke);
        geration.add(item);
      }
    }
    return ReturnApiList(list: geration, msg: 'Erro ao buscar geratio');
  }
  //
//
//

  @override
  Future<PokemonreturnV2> getpokemons(String url) async {
    final dio = Dio();
    dynamic pokemon;
    var response = await dio.get(url);
    var p = response.data as Map<String, dynamic>;

    if (response.statusCode == 200) {
      var poke = Pokemon.fromJson(p);
      pokemon = poke;
    }

    return PokemonreturnV2(
        erro: 'Erro ao buscar  pokemon v2', pokemon: pokemon);
  }
  //
  //

  @override
  Future<PokemonreturnV2> getpokemonforgerationstart(
      List geration, int pointstart) async {
    List<String> pokemonsurl = [];
    List<Pokemon> pokev2 = [];

    for (var e in geration.getRange(pointstart, pointstart + 15)) {
      var poke = e.url;
      pokemonsurl.add(poke);
    }

    for (var e in pokemonsurl) {
      var poke = await getpokemons(e);
      pokev2.add(poke.pokemon);
    }

    return PokemonreturnV2(
        pokemon: pokev2, erro: 'Não foi possivel listar pokémons');
  }

  @override
  Future<PokemonreturnV2> getpokemonforgeration(
      List geration, int pointstart) async {
    List<String> pokemonsurl = [];
    List<Pokemon> pokev2 = [];

    for (var e in geration.getRange(pointstart, geration.length)) {
      var poke = e.url;
      pokemonsurl.add(poke);
    }

    for (var e in pokemonsurl) {
      var poke = await getpokemons(e);
      pokev2.add(poke.pokemon);
    }

    return PokemonreturnV2(
        pokemon: pokev2, erro: 'Não foi possivel listar pokémons');
  }

//
//
  @override
  Future<Pokemon> seachpokemon(String poke) async {
    dynamic pokemon;
    if (poke.isNotEmpty) {
      final dio = Dio();
      var response = await dio.get('https://pokeapi.co/api/v2/pokemon/$poke');
      var p = response.data as Map<String, dynamic>;
      if (response.statusCode == 200) {
        var poke = Pokemon.fromJson(p);
        pokemon = poke;
      }
    }
    return pokemon;
  }

//DESUSO POR TIME
  @override
  Future<Pokemon> completlistpokemon({required int poke}) async {
    dynamic pokemon;
    final dio = Dio();
    var response = await dio.get('https://pokeapi.co/api/v2/pokemon/$poke');
    var p = response.data as Map<String, dynamic>;
    if (response.statusCode == 200) {
      var poke = Pokemon.fromJson(p);
      pokemon = poke;
    }

    return pokemon;
  }

  @override
  Future<PokeV2outherinfo> outhernfopoke({required String index}) async {
    final dio = Dio();
    dynamic outherinfo;
    var response = await dio.get('https://pokeapi.co/api/v2/pokemon/$index');
    var p = response.data as Map<String, dynamic>;
    if (response.statusCode == 200) {
      var poke = PokeV2outherinfo.fromJson(p);
      outherinfo = poke;
    }
    return outherinfo;
  }

  //
  //
  //
}
