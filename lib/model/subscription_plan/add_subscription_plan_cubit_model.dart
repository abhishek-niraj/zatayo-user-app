// To parse this JSON data, do
//
//     final addSubscriptionPlanCubitModel = addSubscriptionPlanCubitModelFromJson(jsonString);

import 'dart:convert';

AddSubscriptionPlanCubitModel addSubscriptionPlanCubitModelFromJson(String str) => AddSubscriptionPlanCubitModel.fromJson(json.decode(str));

String addSubscriptionPlanCubitModelToJson(AddSubscriptionPlanCubitModel data) => json.encode(data.toJson());

class AddSubscriptionPlanCubitModel {
  final String? subscriptionId;
  final String? inputPrice;
  final String? planFor;

  AddSubscriptionPlanCubitModel({
    this.subscriptionId = '',
    this.inputPrice = '',
    this.planFor = '',
  });

  AddSubscriptionPlanCubitModel copyWith({
    String? subscriptionId,
    String? inputPrice,
    String? planFor,
  }) =>
      AddSubscriptionPlanCubitModel(
        subscriptionId: subscriptionId ?? this.subscriptionId,
        inputPrice: inputPrice ?? this.inputPrice,
        planFor: planFor ?? this.planFor,
      );

  factory AddSubscriptionPlanCubitModel.fromJson(Map<String, dynamic> json) => AddSubscriptionPlanCubitModel(
    subscriptionId: json["subscriptionId"],
    inputPrice: json["inputPrice"],
    planFor: json["planFor"],
  );

  Map<String, dynamic> toJson() => {
    "subscriptionId": subscriptionId,
    "inputPrice": inputPrice,
    "planFor": planFor,
  };
}
