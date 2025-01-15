// To parse this JSON data, do
//
//     final subscriptionPlanBenefitsResponseModel = subscriptionPlanBenefitsResponseModelFromJson(jsonString);

import 'dart:convert';

SubscriptionPlanBenefitsResponseModel subscriptionPlanBenefitsResponseModelFromJson(String str) => SubscriptionPlanBenefitsResponseModel.fromJson(json.decode(str));

String subscriptionPlanBenefitsResponseModelToJson(SubscriptionPlanBenefitsResponseModel data) => json.encode(data.toJson());

class SubscriptionPlanBenefitsResponseModel {
  final int? statusCode;
  final List<Datum>? data;

  SubscriptionPlanBenefitsResponseModel({
    this.statusCode,
    this.data,
  });

  factory SubscriptionPlanBenefitsResponseModel.fromJson(Map<String, dynamic> json) => SubscriptionPlanBenefitsResponseModel(
    statusCode: json["statusCode"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final String? subscriptionId;
  final String? subscriptionName;
  final String? subscriptionPrice;
  final String? subscriptionYearlyPrice;
  final int? isOffer;
  final String? offerDescription;
  final int? trialFor;
  final String? offerPerCentageOnMonth;
  final String? offerPerCentageOnYear;
  final List<SubscriptionPlanBenefit>? subscriptionPlanBenefits;

  Datum({
    this.subscriptionId,
    this.subscriptionName,
    this.subscriptionPrice,
    this.subscriptionYearlyPrice,
    this.isOffer,
    this.offerDescription,
    this.trialFor,
    this.offerPerCentageOnMonth,
    this.offerPerCentageOnYear,
    this.subscriptionPlanBenefits,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    subscriptionId: json["subscriptionId"],
    subscriptionName: json["subscriptionName"],
    subscriptionPrice: json["subscriptionPrice"],
    subscriptionYearlyPrice: json["subscriptionYearlyPrice"],
    isOffer: json["isOffer"],
    offerDescription: json["offerDescription"],
    trialFor: json["trialFor"],
    offerPerCentageOnMonth: json["offerPerCentageOnMonth"],
    offerPerCentageOnYear: json["offerPerCentageOnYear"],
    subscriptionPlanBenefits: json["subscriptionPlanBenefits"] == null ? [] : List<SubscriptionPlanBenefit>.from(json["subscriptionPlanBenefits"]!.map((x) => SubscriptionPlanBenefit.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "subscriptionId": subscriptionId,
    "subscriptionName": subscriptionName,
    "subscriptionPrice": subscriptionPrice,
    "subscriptionYearlyPrice": subscriptionYearlyPrice,
    "isOffer": isOffer,
    "offerDescription": offerDescription,
    "trialFor": trialFor,
    "offerPerCentageOnMonth": offerPerCentageOnMonth,
    "offerPerCentageOnYear": offerPerCentageOnYear,
    "subscriptionPlanBenefits": subscriptionPlanBenefits == null ? [] : List<dynamic>.from(subscriptionPlanBenefits!.map((x) => x.toJson())),
  };
}

class SubscriptionPlanBenefit {
  final String? title;
  final String? subscriptionBenefitsDescription;

  SubscriptionPlanBenefit({
    this.title,
    this.subscriptionBenefitsDescription,
  });

  factory SubscriptionPlanBenefit.fromJson(Map<String, dynamic> json) => SubscriptionPlanBenefit(
    title: json["title"],
    subscriptionBenefitsDescription: json["subscriptionBenefitsDescription"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subscriptionBenefitsDescription": subscriptionBenefitsDescription,
  };
}
