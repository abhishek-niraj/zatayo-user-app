// To parse this JSON data, do
//
//     final getMyPlanInformationResponseModel = getMyPlanInformationResponseModelFromJson(jsonString);

import 'dart:convert';

GetMyPlanInformationResponseModel getMyPlanInformationResponseModelFromJson(String str) => GetMyPlanInformationResponseModel.fromJson(json.decode(str));

String getMyPlanInformationResponseModelToJson(GetMyPlanInformationResponseModel data) => json.encode(data.toJson());

class GetMyPlanInformationResponseModel {
  final int? statusCode;
  final List<Datum>? data;

  GetMyPlanInformationResponseModel({
    this.statusCode,
    this.data,
  });

  GetMyPlanInformationResponseModel copyWith({
    int? statusCode,
    List<Datum>? data,
  }) =>
      GetMyPlanInformationResponseModel(
        statusCode: statusCode ?? this.statusCode,
        data: data ?? this.data,
      );

  factory GetMyPlanInformationResponseModel.fromJson(Map<String, dynamic> json) => GetMyPlanInformationResponseModel(
    statusCode: json["statusCode"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final String? subscriptionStatus;
  final int? id;
  final String? planName;
  final String? image;
  final DateTime? expiryDate;
  final String? diamondDays;
  final String? goldDays;
  final String? sliverDays;
  final String? remainingDiamondDays;
  final String? remainingGoldDays;
  final String? remainingSliverDays;
  final String? totalRemainingDays;

  Datum({
    this.subscriptionStatus,
    this.id,
    this.planName,
    this.image,
    this.expiryDate,
    this.diamondDays,
    this.goldDays,
    this.sliverDays,
    this.remainingDiamondDays,
    this.remainingGoldDays,
    this.remainingSliverDays,
    this.totalRemainingDays
  });

  Datum copyWith({
    String? subscriptionStatus,
    int? id,
    String? planName,
    String? image,
    DateTime? expiryDate,
    String? diamondDays,
    String? goldDays,
    String? sliverDays,
    String? remainingDiamondDays,
    String? remainingGoldDays,
    String? remainingSliverDays,
    String? totalRemainingDays
  }) =>
      Datum(
        subscriptionStatus: subscriptionStatus ?? this.subscriptionStatus,
        id: id ?? this.id,
        planName: planName ?? this.planName,
        image: image ?? this.image,
        expiryDate: expiryDate ?? this.expiryDate,
        diamondDays: diamondDays ?? this.diamondDays,
        goldDays: goldDays ?? this.goldDays,
        sliverDays: sliverDays ?? this.sliverDays,
        remainingDiamondDays: remainingDiamondDays ?? this.remainingDiamondDays,
        remainingGoldDays: remainingGoldDays ?? this.remainingGoldDays,
        remainingSliverDays: remainingSliverDays ?? this.remainingSliverDays,
        totalRemainingDays: totalRemainingDays ?? this.totalRemainingDays
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    subscriptionStatus: json["subscriptionStatus"],
    id: json["id"],
    planName: json["planName"],
    image: json["image"],
    expiryDate: json["expiryDate"] == null ? null : DateTime.parse(json["expiryDate"]),
    diamondDays: json["diamondDays"],
    goldDays: json["goldDays"],
    sliverDays: json["sliverDays"],
    remainingDiamondDays: json["remainingDiamondDays"],
    remainingGoldDays: json["remainingGoldDays"],
    remainingSliverDays: json["remainingSliverDays"],
    totalRemainingDays: json["totalRemainingDays"]
  );

  Map<String, dynamic> toJson() => {
    "subscriptionStatus": subscriptionStatus,
    "id": id,
    "planName": planName,
    "image": image,
    "expiryDate": "${expiryDate!.year.toString().padLeft(4, '0')}-${expiryDate!.month.toString().padLeft(2, '0')}-${expiryDate!.day.toString().padLeft(2, '0')}",
    "diamondDays": diamondDays,
    "goldDays": goldDays,
    "sliverDays": sliverDays,
    "remainingDiamondDays": remainingDiamondDays,
    "remainingGoldDays": remainingGoldDays,
    "remainingSliverDays": remainingSliverDays,
    "totalRemainingDays":totalRemainingDays
  };
}
