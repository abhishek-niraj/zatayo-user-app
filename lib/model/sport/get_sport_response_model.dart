// To parse this JSON data, do
//
//     final getSportsResponseModel = getSportsResponseModelFromJson(jsonString);

import 'dart:convert';

GetSportsResponseModel getSportsResponseModelFromJson(String str) => GetSportsResponseModel.fromJson(json.decode(str));

String getSportsResponseModelToJson(GetSportsResponseModel data) => json.encode(data.toJson());

class GetSportsResponseModel {
  final int? statusCode;
  final List<Datum>? data;

  GetSportsResponseModel({
    this.statusCode,
    this.data,
  });

  GetSportsResponseModel copyWith({
    int? statusCode,
    List<Datum>? data,
  }) =>
      GetSportsResponseModel(
        statusCode: statusCode ?? this.statusCode,
        data: data ?? this.data,
      );

  factory GetSportsResponseModel.fromJson(Map<String, dynamic> json) => GetSportsResponseModel(
    statusCode: json["statusCode"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final int? id;
  final String? sportId;
  final String? name;
  final String? description;
  final String? image;

  Datum({
    this.id,
    this.sportId,
    this.name,
    this.description,
    this.image,
  });

  Datum copyWith({
    int? id,
    String? sportId,
    String? name,
    String? description,
    String? image,
  }) =>
      Datum(
        id: id ?? this.id,
        sportId: sportId ?? this.sportId,
        name: name ?? this.name,
        description: description ?? this.description,
        image: image ?? this.image,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    sportId: json["sportId"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sportId": sportId,
    "name": name,
    "description": description,
    "image": image,
  };
}
