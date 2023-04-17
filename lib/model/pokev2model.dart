// To parse this JSON data, do
//
//     final pokemonV2 = pokemonV2FromJson(jsonString);

import 'dart:convert';

PokemonV2 pokemonV2FromJson(String str) => PokemonV2.fromJson(json.decode(str));

String pokemonV2ToJson(PokemonV2 data) => json.encode(data.toJson());

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

class PokemonV2 {
  PokemonV2({
    this.abilities,
    this.baseExperience,
    this.height,
    this.id,
    this.name,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  List<Ability>? abilities;
  int? baseExperience;
  int? height;
  int? id;
  String? name;
  Sprites? sprites;
  List<Stat>? stats;
  List<Type>? types;
  int? weight;

  factory PokemonV2.fromJson(Map<String, dynamic> json) => PokemonV2(
        abilities: json["abilities"] == null
            ? []
            : List<Ability>.from(
                json["abilities"]!.map((x) => Ability.fromJson(x))),
        baseExperience: json["base_experience"],
        height: json["height"],
        id: json["id"],
        name: json["name"] == null ? 'Nome Nulo' : json["name"],
        sprites:
            json["sprites"] == null ? null : Sprites.fromJson(json["sprites"]),
        stats: json["stats"] == null
            ? []
            : List<Stat>.from(json["stats"]!.map((x) => Stat.fromJson(x))),
        types: json["types"] == null
            ? []
            : List<Type>.from(json["types"]!.map((x) => Type.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "abilities": abilities == null
            ? []
            : List<dynamic>.from(abilities!.map((x) => x.toJson())),
        "base_experience": baseExperience,
        "height": height,
        "id": id,
        "name": name,
        "sprites": sprites?.toJson(),
        "stats": stats == null
            ? []
            : List<dynamic>.from(stats!.map((x) => x.toJson())),
        "types": types == null
            ? []
            : List<dynamic>.from(types!.map((x) => x.toJson())),
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

class GenerationV {
  GenerationV({
    this.blackWhite,
  });

  Sprites? blackWhite;

  factory GenerationV.fromJson(Map<String, dynamic> json) => GenerationV(
        blackWhite: json["black-white"] == null
            ? null
            : Sprites.fromJson(json["black-white"]),
      );

  Map<String, dynamic> toJson() => {
        "black-white": blackWhite?.toJson(),
      };
}

class GenerationIv {
  GenerationIv({
    this.diamondPearl,
    this.heartgoldSoulsilver,
    this.platinum,
  });

  Sprites? diamondPearl;
  Sprites? heartgoldSoulsilver;
  Sprites? platinum;

  factory GenerationIv.fromJson(Map<String, dynamic> json) => GenerationIv(
        diamondPearl: json["diamond-pearl"] == null
            ? null
            : Sprites.fromJson(json["diamond-pearl"]),
        heartgoldSoulsilver: json["heartgold-soulsilver"] == null
            ? null
            : Sprites.fromJson(json["heartgold-soulsilver"]),
        platinum: json["platinum"] == null
            ? null
            : Sprites.fromJson(json["platinum"]),
      );

  Map<String, dynamic> toJson() => {
        "diamond-pearl": diamondPearl?.toJson(),
        "heartgold-soulsilver": heartgoldSoulsilver?.toJson(),
        "platinum": platinum?.toJson(),
      };
}

class Versions {
  Versions({
    this.generationI,
    this.generationIi,
    this.generationIii,
    this.generationIv,
    this.generationV,
    this.generationVi,
    this.generationVii,
    this.generationViii,
  });

  GenerationI? generationI;
  GenerationIi? generationIi;
  GenerationIii? generationIii;
  GenerationIv? generationIv;
  GenerationV? generationV;
  Map<String, Home>? generationVi;
  GenerationVii? generationVii;
  GenerationViii? generationViii;

  factory Versions.fromJson(Map<String, dynamic> json) => Versions(
        generationI: json["generation-i"] == null
            ? null
            : GenerationI.fromJson(json["generation-i"]),
        generationIi: json["generation-ii"] == null
            ? null
            : GenerationIi.fromJson(json["generation-ii"]),
        generationIii: json["generation-iii"] == null
            ? null
            : GenerationIii.fromJson(json["generation-iii"]),
        generationIv: json["generation-iv"] == null
            ? null
            : GenerationIv.fromJson(json["generation-iv"]),
        generationV: json["generation-v"] == null
            ? null
            : GenerationV.fromJson(json["generation-v"]),
        generationVi: Map.from(json["generation-vi"]!)
            .map((k, v) => MapEntry<String, Home>(k, Home.fromJson(v))),
        generationVii: json["generation-vii"] == null
            ? null
            : GenerationVii.fromJson(json["generation-vii"]),
        generationViii: json["generation-viii"] == null
            ? null
            : GenerationViii.fromJson(json["generation-viii"]),
      );

  Map<String, dynamic> toJson() => {
        "generation-i": generationI?.toJson(),
        "generation-ii": generationIi?.toJson(),
        "generation-iii": generationIii?.toJson(),
        "generation-iv": generationIv?.toJson(),
        "generation-v": generationV?.toJson(),
        "generation-vi": Map.from(generationVi!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "generation-vii": generationVii?.toJson(),
        "generation-viii": generationViii?.toJson(),
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
    this.other,
    this.versions,
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
  Other? other;
  Versions? versions;
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
        other: json["other"] == null ? null : Other.fromJson(json["other"]),
        versions: json["versions"] == null
            ? null
            : Versions.fromJson(json["versions"]),
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
        "other": other?.toJson(),
        "versions": versions?.toJson(),
        "animated": animated?.toJson(),
      };
}

class GenerationI {
  GenerationI({
    this.redBlue,
    this.yellow,
  });

  RedBlue? redBlue;
  RedBlue? yellow;

  factory GenerationI.fromJson(Map<String, dynamic> json) => GenerationI(
        redBlue: json["red-blue"] == null
            ? null
            : RedBlue.fromJson(json["red-blue"]),
        yellow:
            json["yellow"] == null ? null : RedBlue.fromJson(json["yellow"]),
      );

  Map<String, dynamic> toJson() => {
        "red-blue": redBlue?.toJson(),
        "yellow": yellow?.toJson(),
      };
}

class RedBlue {
  RedBlue({
    this.backDefault,
    this.backGray,
    this.backTransparent,
    this.frontDefault,
    this.frontGray,
    this.frontTransparent,
  });

  dynamic backDefault;
  dynamic backGray;
  dynamic backTransparent;
  dynamic frontDefault;
  dynamic frontGray;
  dynamic frontTransparent;

  factory RedBlue.fromJson(Map<String, dynamic> json) => RedBlue(
        backDefault: json["back_default"],
        backGray: json["back_gray"],
        backTransparent: json["back_transparent"],
        frontDefault: json["front_default"],
        frontGray: json["front_gray"],
        frontTransparent: json["front_transparent"],
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_gray": backGray,
        "back_transparent": backTransparent,
        "front_default": frontDefault,
        "front_gray": frontGray,
        "front_transparent": frontTransparent,
      };
}

class GenerationIi {
  GenerationIi({
    this.crystal,
    this.gold,
    this.silver,
  });

  Crystal? crystal;
  Gold? gold;
  Gold? silver;

  factory GenerationIi.fromJson(Map<String, dynamic> json) => GenerationIi(
        crystal:
            json["crystal"] == null ? null : Crystal.fromJson(json["crystal"]),
        gold: json["gold"] == null ? null : Gold.fromJson(json["gold"]),
        silver: json["silver"] == null ? null : Gold.fromJson(json["silver"]),
      );

  Map<String, dynamic> toJson() => {
        "crystal": crystal?.toJson(),
        "gold": gold?.toJson(),
        "silver": silver?.toJson(),
      };
}

class Crystal {
  Crystal({
    this.backDefault,
    this.backShiny,
    this.backShinyTransparent,
    this.backTransparent,
    this.frontDefault,
    this.frontShiny,
    this.frontShinyTransparent,
    this.frontTransparent,
  });

  String? backDefault;
  String? backShiny;
  String? backShinyTransparent;
  String? backTransparent;
  String? frontDefault;
  String? frontShiny;
  String? frontShinyTransparent;
  String? frontTransparent;

  factory Crystal.fromJson(Map<String, dynamic> json) => Crystal(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        backShinyTransparent: json["back_shiny_transparent"],
        backTransparent: json["back_transparent"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        frontShinyTransparent: json["front_shiny_transparent"],
        frontTransparent: json["front_transparent"],
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "back_shiny_transparent": backShinyTransparent,
        "back_transparent": backTransparent,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "front_shiny_transparent": frontShinyTransparent,
        "front_transparent": frontTransparent,
      };
}

class Gold {
  Gold({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
    this.frontTransparent,
  });

  String? backDefault;
  String? backShiny;
  String? frontDefault;
  String? frontShiny;
  String? frontTransparent;

  factory Gold.fromJson(Map<String, dynamic> json) => Gold(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        frontTransparent: json["front_transparent"],
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "front_transparent": frontTransparent,
      };
}

class GenerationIii {
  GenerationIii({
    this.emerald,
    this.fireredLeafgreen,
    this.rubySapphire,
  });

  OfficialArtwork? emerald;
  Gold? fireredLeafgreen;
  Gold? rubySapphire;

  factory GenerationIii.fromJson(Map<String, dynamic> json) => GenerationIii(
        emerald: json["emerald"] == null
            ? null
            : OfficialArtwork.fromJson(json["emerald"]),
        fireredLeafgreen: json["firered-leafgreen"] == null
            ? null
            : Gold.fromJson(json["firered-leafgreen"]),
        rubySapphire: json["ruby-sapphire"] == null
            ? null
            : Gold.fromJson(json["ruby-sapphire"]),
      );

  Map<String, dynamic> toJson() => {
        "emerald": emerald?.toJson(),
        "firered-leafgreen": fireredLeafgreen?.toJson(),
        "ruby-sapphire": rubySapphire?.toJson(),
      };
}

class OfficialArtwork {
  OfficialArtwork({
    this.frontDefault,
    this.frontShiny,
  });

  String? frontDefault;
  String? frontShiny;

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}

class Home {
  Home({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  String? frontDefault;
  dynamic frontFemale;
  String? frontShiny;
  dynamic frontShinyFemale;

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
      };
}

class GenerationVii {
  GenerationVii({
    this.icons,
    this.ultraSunUltraMoon,
  });

  DreamWorld? icons;
  Home? ultraSunUltraMoon;

  factory GenerationVii.fromJson(Map<String, dynamic> json) => GenerationVii(
        icons:
            json["icons"] == null ? null : DreamWorld.fromJson(json["icons"]),
        ultraSunUltraMoon: json["ultra-sun-ultra-moon"] == null
            ? null
            : Home.fromJson(json["ultra-sun-ultra-moon"]),
      );

  Map<String, dynamic> toJson() => {
        "icons": icons?.toJson(),
        "ultra-sun-ultra-moon": ultraSunUltraMoon?.toJson(),
      };
}

class DreamWorld {
  DreamWorld({
    this.frontDefault,
    this.frontFemale,
  });

  String? frontDefault;
  dynamic frontFemale;

  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
      };
}

class GenerationViii {
  GenerationViii({
    this.icons,
  });

  DreamWorld? icons;

  factory GenerationViii.fromJson(Map<String, dynamic> json) => GenerationViii(
        icons:
            json["icons"] == null ? null : DreamWorld.fromJson(json["icons"]),
      );

  Map<String, dynamic> toJson() => {
        "icons": icons?.toJson(),
      };
}

class Other {
  Other({
    this.dreamWorld,
    this.home,
    this.officialArtwork,
  });

  DreamWorld? dreamWorld;
  Home? home;
  OfficialArtwork? officialArtwork;

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        dreamWorld: json["dream_world"] == null
            ? null
            : DreamWorld.fromJson(json["dream_world"]),
        home: json["home"] == null ? null : Home.fromJson(json["home"]),
        officialArtwork: json["official-artwork"] == null
            ? null
            : OfficialArtwork.fromJson(json["official-artwork"]),
      );

  Map<String, dynamic> toJson() => {
        "dream_world": dreamWorld?.toJson(),
        "home": home?.toJson(),
        "official-artwork": officialArtwork?.toJson(),
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
