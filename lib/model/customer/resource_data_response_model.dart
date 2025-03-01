// To parse this JSON data, do
//
//     final resourceDataResponseModel = resourceDataResponseModelFromJson(jsonString);

import 'dart:convert';

ResourceDataResponseModel resourceDataResponseModelFromJson(String str) => ResourceDataResponseModel.fromJson(json.decode(str));

String resourceDataResponseModelToJson(ResourceDataResponseModel data) => json.encode(data.toJson());

class ResourceDataResponseModel {
  final int? statusCode;
  final List<Datum>? data;

  ResourceDataResponseModel({
    this.statusCode,
    this.data,
  });

  ResourceDataResponseModel copyWith({
    int? statusCode,
    List<Datum>? data,
  }) =>
      ResourceDataResponseModel(
        statusCode: statusCode ?? this.statusCode,
        data: data ?? this.data,
      );

  factory ResourceDataResponseModel.fromJson(Map<String, dynamic> json) => ResourceDataResponseModel(
    statusCode: json["statusCode"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final int? resourceData;

  Datum({
    this.resourceData,
  });

  Datum copyWith({
    int? resourceData,
  }) =>
      Datum(
        resourceData: resourceData ?? this.resourceData,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    resourceData: json["resourceData"],
  );

  Map<String, dynamic> toJson() => {
    "resourceData": resourceData,
  };
}
