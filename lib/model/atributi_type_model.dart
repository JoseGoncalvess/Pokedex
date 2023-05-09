// To parse this JSON data, do
//
//     final atributsType = atributsTypeFromJson(jsonString);

import 'dart:convert';

Map<String, AtributsType> atributsTypeFromJson(String str) =>
    Map.from(json.decode(str)).map(
        (k, v) => MapEntry<String, AtributsType>(k, AtributsType.fromJson(v)));

String atributsTypeToJson(Map<String, AtributsType> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class AtributsType {
  List<String>? vantagem;
  List<String>? desvantagem;

  AtributsType({
    this.vantagem,
    this.desvantagem,
  });

  factory AtributsType.fromJson(Map<String, dynamic> json) => AtributsType(
        vantagem: json["Vantagem"] == null
            ? []
            : List<String>.from(json["Vantagem"]!.map((x) => x)),
        desvantagem: json["Desvantagem"] == null
            ? []
            : List<String>.from(json["Desvantagem"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Vantagem":
            vantagem == null ? [] : List<dynamic>.from(vantagem!.map((x) => x)),
        "Desvantagem": desvantagem == null
            ? []
            : List<dynamic>.from(desvantagem!.map((x) => x)),
      };
}
