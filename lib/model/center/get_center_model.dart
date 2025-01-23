// To parse this JSON data, do
//
//     final getCenterResponseModel = getCenterResponseModelFromJson(jsonString);

import 'dart:convert';

GetCenterResponseModel getCenterResponseModelFromJson(String str) => GetCenterResponseModel.fromJson(json.decode(str));

String getCenterResponseModelToJson(GetCenterResponseModel data) => json.encode(data.toJson());

class GetCenterResponseModel {
  final int? statusCode;
  final List<Datum>? data;

  GetCenterResponseModel({
    this.statusCode,
    this.data,
  });

  GetCenterResponseModel copyWith({
    int? statusCode,
    List<Datum>? data,
  }) =>
      GetCenterResponseModel(
        statusCode: statusCode ?? this.statusCode,
        data: data ?? this.data,
      );

  factory GetCenterResponseModel.fromJson(Map<String, dynamic> json) => GetCenterResponseModel(
    statusCode: json["statusCode"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final String? city;
  final int? centersNumber;

  Datum({
    this.city,
    this.centersNumber,
  });

  Datum copyWith({
    String? city,
    int? centersNumber,
  }) =>
      Datum(
        city: city ?? this.city,
        centersNumber: centersNumber ?? this.centersNumber,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    city: json["city"],
    centersNumber: json["centersNumber"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "centersNumber": centersNumber,
  };
}
