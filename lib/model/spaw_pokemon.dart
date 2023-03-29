// To parse this JSON data, do
//
//     final spawpokemon = spawpokemonFromJson(jsonString);

import 'dart:convert';

List<Spawpokemon> spawpokemonFromJson(String str) => List<Spawpokemon>.from(
    json.decode(str).map((x) => Spawpokemon.fromJson(x)));

String spawpokemonToJson(List<Spawpokemon> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Spawpokemon {
  Spawpokemon({
    this.locationArea,
    this.versionDetails,
  });

  LocationArea? locationArea;
  List<VersionDetail>? versionDetails;

  factory Spawpokemon.fromJson(Map<String, dynamic> json) => Spawpokemon(
        locationArea: json["location_area"] == null
            ? null
            : LocationArea.fromJson(json["location_area"]),
        versionDetails: json["version_details"] == null
            ? []
            : List<VersionDetail>.from(
                json["version_details"]!.map((x) => VersionDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "location_area": locationArea?.toJson(),
        "version_details": versionDetails == null
            ? []
            : List<dynamic>.from(versionDetails!.map((x) => x.toJson())),
      };
}

class LocationArea {
  LocationArea({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory LocationArea.fromJson(Map<String, dynamic> json) => LocationArea(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class VersionDetail {
  VersionDetail({
    this.encounterDetails,
    this.maxChance,
    this.version,
  });

  List<EncounterDetail>? encounterDetails;
  int? maxChance;
  LocationArea? version;

  factory VersionDetail.fromJson(Map<String, dynamic> json) => VersionDetail(
        encounterDetails: json["encounter_details"] == null
            ? []
            : List<EncounterDetail>.from(json["encounter_details"]!
                .map((x) => EncounterDetail.fromJson(x))),
        maxChance: json["max_chance"],
        version: json["version"] == null
            ? null
            : LocationArea.fromJson(json["version"]),
      );

  Map<String, dynamic> toJson() => {
        "encounter_details": encounterDetails == null
            ? []
            : List<dynamic>.from(encounterDetails!.map((x) => x.toJson())),
        "max_chance": maxChance,
        "version": version?.toJson(),
      };
}

class EncounterDetail {
  EncounterDetail({
    this.chance,
    this.conditionValues,
    this.maxLevel,
    this.method,
    this.minLevel,
  });

  int? chance;
  List<LocationArea>? conditionValues;
  int? maxLevel;
  LocationArea? method;
  int? minLevel;

  factory EncounterDetail.fromJson(Map<String, dynamic> json) =>
      EncounterDetail(
        chance: json["chance"],
        conditionValues: json["condition_values"] == null
            ? []
            : List<LocationArea>.from(
                json["condition_values"]!.map((x) => LocationArea.fromJson(x))),
        maxLevel: json["max_level"],
        method: json["method"] == null
            ? null
            : LocationArea.fromJson(json["method"]),
        minLevel: json["min_level"],
      );

  Map<String, dynamic> toJson() => {
        "chance": chance,
        "condition_values": conditionValues == null
            ? []
            : List<dynamic>.from(conditionValues!.map((x) => x.toJson())),
        "max_level": maxLevel,
        "method": method?.toJson(),
        "min_level": minLevel,
      };
}
