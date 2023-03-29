// To parse this JSON data, do
//
//     final pokeModel = pokeModelFromJson(jsonString);

import 'dart:convert';

PokeModel pokeModelFromJson(String str) => PokeModel.fromJson(json.decode(str));

String pokeModelToJson(PokeModel data) => json.encode(data.toJson());

class PokeModel {
  PokeModel({
    required this.pokemon,
  });

  List<Pokemon> pokemon;
//convertendo o json obtido da requisição para um modelo do nosso objeto
  factory PokeModel.fromJson(Map<String, dynamic> json) => PokeModel(
        pokemon:
            List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
      );
//A análise de JSON é útil, mas às vezes queremos converter um objeto de modelo de volta para JSON
  Map<String, dynamic> toJson() => {
        "pokemon": List<dynamic>.from(pokemon.map((x) => x.toJson())),
      };
}

class Pokemon {
  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    this.candyCount,
    required this.egg,
    required this.spawnChance,
    required this.avgSpawns,
    required this.spawnTime,
    this.multipliers,
    required this.weaknesses,
    this.nextEvolution,
    this.prevEvolution,
  });

  int id;
  String num;
  String name;
  String img;
  //Mudei aqui era Type PRA STRING
  List<String> type;
  String height;
  String weight;
  String candy;
  int? candyCount;
  Egg egg;
  double spawnChance;
  double avgSpawns;
  String spawnTime;
  List<double>? multipliers;
  List<Type> weaknesses;
  List<Evolution>? nextEvolution;
  List<Evolution>? prevEvolution;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        num: json["num"],
        name: json["name"],
        img: json["img"],
        //PEGO O JSON QUE ME RETORNOU ACESSO A LISTA 'TYPE'( CHAVE) ETRANSFORMO EM MAP  FALANDPO O QUE O E E UAM STRIG E DEPOIS TRANSFORMO EM LISTA
        type: (json["type"] as List<dynamic>).map((e) => e as String).toList(),
        height: json["height"],
        weight: json["weight"],
        candy: json["candy"],
        candyCount: json["candy_count"],
        egg: eggValues.map[json["egg"]]!,
        spawnChance: json["spawn_chance"]?.toDouble(),
        avgSpawns: json["avg_spawns"]?.toDouble(),
        spawnTime: json["spawn_time"],
        multipliers: json["multipliers"] == null
            ? []
            : List<double>.from(json["multipliers"]!.map((x) => x?.toDouble())),
        weaknesses:
            List<Type>.from(json["weaknesses"].map((x) => typeValues.map[x]!)),
        nextEvolution: json["next_evolution"] == null
            ? []
            : List<Evolution>.from(
                json["next_evolution"]!.map((x) => Evolution.fromJson(x))),
        prevEvolution: json["prev_evolution"] == null
            ? []
            : List<Evolution>.from(
                json["prev_evolution"]!.map((x) => Evolution.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "num": num,
        "name": name,
        "img": img,
        "type": List<dynamic>.from(type.map((x) => typeValues.reverse[x])),
        "height": height,
        "weight": weight,
        "candy": candy,
        "candy_count": candyCount,
        "egg": eggValues.reverse[egg],
        "spawn_chance": spawnChance,
        "avg_spawns": avgSpawns,
        "spawn_time": spawnTime,
        "multipliers": multipliers == null
            ? []
            : List<dynamic>.from(multipliers!.map((x) => x)),
        "weaknesses":
            List<dynamic>.from(weaknesses.map((x) => typeValues.reverse[x])),
        "next_evolution": nextEvolution == null
            ? []
            : List<dynamic>.from(nextEvolution!.map((x) => x.toJson())),
        "prev_evolution": prevEvolution == null
            ? []
            : List<dynamic>.from(prevEvolution!.map((x) => x.toJson())),
      };
}

enum Egg { THE_2_KM, NOT_IN_EGGS, THE_5_KM, THE_10_KM, OMANYTE_CANDY }

final eggValues = EnumValues({
  "Not in Eggs": Egg.NOT_IN_EGGS,
  "Omanyte Candy": Egg.OMANYTE_CANDY,
  "10 km": Egg.THE_10_KM,
  "2 km": Egg.THE_2_KM,
  "5 km": Egg.THE_5_KM
});

class Evolution {
  Evolution({
    required this.num,
    required this.name,
  });

  String num;
  String name;

  factory Evolution.fromJson(Map<String, dynamic> json) => Evolution(
        num: json["num"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "num": num,
        "name": name,
      };
}

enum Type {
  FIRE,
  ICE,
  FLYING,
  PSYCHIC,
  WATER,
  GROUND,
  ROCK,
  ELECTRIC,
  GRASS,
  FIGHTING,
  POISON,
  BUG,
  FAIRY,
  GHOST,
  DARK,
  STEEL,
  DRAGON,
  NORMAL
}

final typeValues = EnumValues({
  "Bug": Type.BUG,
  "Dark": Type.DARK,
  "Dragon": Type.DRAGON,
  "Electric": Type.ELECTRIC,
  "Fairy": Type.FAIRY,
  "Fighting": Type.FIGHTING,
  "Fire": Type.FIRE,
  "Flying": Type.FLYING,
  "Ghost": Type.GHOST,
  "Grass": Type.GRASS,
  "Ground": Type.GROUND,
  "Ice": Type.ICE,
  "Normal": Type.NORMAL,
  "Poison": Type.POISON,
  "Psychic": Type.PSYCHIC,
  "Rock": Type.ROCK,
  "Steel": Type.STEEL,
  "Water": Type.WATER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
