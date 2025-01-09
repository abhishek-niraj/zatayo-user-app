// To parse this JSON data, do
//
//     final subscriptionPlanResponseModel = subscriptionPlanResponseModelFromJson(jsonString);

import 'dart:convert';

SubscriptionPlanResponseModel subscriptionPlanResponseModelFromJson(
        String str) =>
    SubscriptionPlanResponseModel.fromJson(json.decode(str));

String subscriptionPlanResponseModelToJson(
        SubscriptionPlanResponseModel data) =>
    json.encode(data.toJson());

class SubscriptionPlanResponseModel {
  final int? statusCode;
  final List<SubscriptionPlanList>? data;

  SubscriptionPlanResponseModel({
    this.statusCode,
    this.data,
  });

  factory SubscriptionPlanResponseModel.fromJson(Map<String, dynamic> json) =>
      SubscriptionPlanResponseModel(
        statusCode: json["statusCode"],
        data: json["data"] == null
            ? []
            : List<SubscriptionPlanList>.from(
                json["data"]!.map((x) => SubscriptionPlanList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SubscriptionPlanList {
  final int? id;
  final String? name;
  final String? price;
  final String? subscriptionId;
  final String? image;
  final String? description;

  SubscriptionPlanList({
    this.id,
    this.name,
    this.price,
    this.subscriptionId,
    this.image,
    this.description,
  });

  factory SubscriptionPlanList.fromJson(Map<String, dynamic> json) =>
      SubscriptionPlanList(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        subscriptionId: json["subscriptionId"],
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "subscriptionId": subscriptionId,
        "image": image,
        "description": description,
      };
}
