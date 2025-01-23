// To parse this JSON data, do
//
//     final getDealOfDayResponseModel = getDealOfDayResponseModelFromJson(jsonString);

import 'dart:convert';

GetDealOfDayResponseModel getDealOfDayResponseModelFromJson(String str) => GetDealOfDayResponseModel.fromJson(json.decode(str));

String getDealOfDayResponseModelToJson(GetDealOfDayResponseModel data) => json.encode(data.toJson());

class GetDealOfDayResponseModel {
  final int? statusCode;
  final List<Datum>? data;

  GetDealOfDayResponseModel({
    this.statusCode,
    this.data,
  });

  GetDealOfDayResponseModel copyWith({
    int? statusCode,
    List<Datum>? data,
  }) =>
      GetDealOfDayResponseModel(
        statusCode: statusCode ?? this.statusCode,
        data: data ?? this.data,
      );

  factory GetDealOfDayResponseModel.fromJson(Map<String, dynamic> json) => GetDealOfDayResponseModel(
    statusCode: json["statusCode"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final int? dealId;
  final String? image;
  final String? titleOne;
  final String? titleTwo;
  final String? onPlan;

  Datum({
    this.dealId,
    this.image,
    this.titleOne,
    this.titleTwo,
    this.onPlan,
  });

  Datum copyWith({
    int? dealId,
    String? image,
    String? titleOne,
    String? titleTwo,
    String? onPlan,
  }) =>
      Datum(
        dealId: dealId ?? this.dealId,
        image: image ?? this.image,
        titleOne: titleOne ?? this.titleOne,
        titleTwo: titleTwo ?? this.titleTwo,
        onPlan: onPlan ?? this.onPlan,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    dealId: json["dealId"],
    image: json["image"],
    titleOne: json["titleOne"],
    titleTwo: json["titleTwo"],
    onPlan: json["onPlan"],
  );

  Map<String, dynamic> toJson() => {
    "dealId": dealId,
    "image": image,
    "titleOne": titleOne,
    "titleTwo": titleTwo,
    "onPlan": onPlan,
  };
}
