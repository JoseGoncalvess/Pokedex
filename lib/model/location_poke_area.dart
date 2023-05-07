// To parse this JSON data, do
//
//     final locatioArea = locatioAreaFromJson(jsonString);

import 'dart:convert';

LocatioArea locatioAreaFromJson(String str) =>
    LocatioArea.fromJson(json.decode(str));

String locatioAreaToJson(LocatioArea data) => json.encode(data.toJson());

class LocatioArea {
  List<Region>? areas;

  int? id;
  String? name;

  Region? region;

  LocatioArea({
    this.areas,
    this.id,
    this.name,
    this.region,
  });

  factory LocatioArea.fromJson(Map<String, dynamic> json) => LocatioArea(
        areas: json["areas"] == null
            ? []
            : List<Region>.from(json["areas"]!.map((x) => Region.fromJson(x))),
        id: json["id"],
        name: json["name"],
        region: json["region"] == null ? null : Region.fromJson(json["region"]),
      );

  Map<String, dynamic> toJson() => {
        "areas": areas == null
            ? []
            : List<dynamic>.from(areas!.map((x) => x.toJson())),
        "id": id,
        "name": name,
        "region": region?.toJson(),
      };
}

class Region {
  String? name;
  String? url;

  Region({
    this.name,
    this.url,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
