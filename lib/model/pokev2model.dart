// To parse this JSON data, do
//
//     final pokemonV2 = pokemonV2FromJson(jsonString);

import 'dart:convert';

//TRANSFORMAÇÕES
PokeV2outherinfo pokemonV2FromJson(String str) =>
    PokeV2outherinfo.fromJson(json.decode(str));

String pokemonV2ToJson(PokeV2outherinfo data) => json.encode(data.toJson());

//===================================================
//MODELO POKEMON
class Pokemon {
  Pokemon({this.id, this.name, this.sprites, this.types});

  int? id;
  String? name;
  Sprites? sprites;
  List<Type>? types;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        name: json["name"] == null ? 'Nome Nulo' : json["name"],
        sprites:
            json["sprites"] == null ? null : Sprites.fromJson(json["sprites"]),
        types: json["types"] == null
            ? []
            : List<Type>.from(json["types"]!.map((x) => Type.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sprites": sprites?.toJson(),
        "types": types == null
            ? []
            : List<dynamic>.from(types!.map((x) => x.toJson())),
      };
}

class PokeV2outherinfo {
  PokeV2outherinfo({
    this.abilities,
    this.baseExperience,
    this.height,
    this.id,
    this.weight,
  });

  List<Ability>? abilities;
  int? baseExperience;
  int? height;
  int? id;
  int? weight;

  factory PokeV2outherinfo.fromJson(Map<String, dynamic> json) =>
      PokeV2outherinfo(
        abilities: json["abilities"] == null
            ? []
            : List<Ability>.from(
                json["abilities"]!.map((x) => Ability.fromJson(x))),
        baseExperience: json["base_experience"],
        height: json["height"],
        id: json["id"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "abilities": abilities == null
            ? []
            : List<dynamic>.from(abilities!.map((x) => x.toJson())),
        "base_experience": baseExperience,
        "height": height,
        "id": id,
        "weight": weight,
      };
}

class Ability {
  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  Species? ability;
  bool? isHidden;
  int? slot;

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability:
            json["ability"] == null ? null : Species.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toJson() => {
        "ability": ability?.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}

class Species {
  Species({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"] == null ? 'Typonull' : json["name"],
        url: json["url"] == null ? '' : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Sprites {
  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.animated,
  });

  String? backDefault;
  dynamic backFemale;
  String? backShiny;
  dynamic backShinyFemale;
  String? frontDefault;
  dynamic frontFemale;
  String? frontShiny;
  dynamic frontShinyFemale;
  Sprites? animated;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
        animated: json["animated"] == null
            ? null
            : Sprites.fromJson(json["animated"]),
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
        "animated": animated?.toJson(),
      };
}

class Stat {
  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  int? baseStat;
  int? effort;
  Species? stat;

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: json["stat"] == null ? null : Species.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat?.toJson(),
      };
}

class Type {
  Type({
    this.slot,
    required this.type,
  });

  int? slot;
  Species type;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        type: json["type"] == null
            ? Species(name: 'erro', url: 'url')
            : Species.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type.toJson(),
      };
}
