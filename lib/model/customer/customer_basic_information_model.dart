// To parse this JSON data, do
//
//     final customerBasicInformationModel = customerBasicInformationModelFromJson(jsonString);

import 'dart:convert';

CustomerBasicInformationModel customerBasicInformationModelFromJson(String str) => CustomerBasicInformationModel.fromJson(json.decode(str));

String customerBasicInformationModelToJson(CustomerBasicInformationModel data) => json.encode(data.toJson());

class CustomerBasicInformationModel {
  final String? customerName;
  final String? customerId;

  CustomerBasicInformationModel({
    this.customerName,
    this.customerId,
  });

  CustomerBasicInformationModel copyWith({
    String? customerName,
    String? customerId,
  }) =>
      CustomerBasicInformationModel(
        customerName: customerName ?? this.customerName,
        customerId: customerId ?? this.customerId,
      );

  factory CustomerBasicInformationModel.fromJson(Map<String, dynamic> json) => CustomerBasicInformationModel(
    customerName: json["customerName"],
    customerId: json["customerId"],
  );

  Map<String, dynamic> toJson() => {
    "customerName": customerName,
    "customerId": customerId,
  };
}
