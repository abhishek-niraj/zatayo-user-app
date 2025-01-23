// To parse this JSON data, do
//
//     final selectCenterCubitModel = selectCenterCubitModelFromJson(jsonString);

import 'dart:convert';

SelectCenterCubitModel selectCenterCubitModelFromJson(String str) => SelectCenterCubitModel.fromJson(json.decode(str));

String selectCenterCubitModelToJson(SelectCenterCubitModel data) => json.encode(data.toJson());

class SelectCenterCubitModel {
  final String? centerName;
  final String? sportId;

  SelectCenterCubitModel({
    this.centerName,
    this.sportId,
  });

  SelectCenterCubitModel copyWith({
    String? centerName,
    String? sportId,
  }) =>
      SelectCenterCubitModel(
        centerName: centerName ?? this.centerName,
        sportId: sportId ?? this.sportId,
      );

  factory SelectCenterCubitModel.fromJson(Map<String, dynamic> json) => SelectCenterCubitModel(
    centerName: json["centerName"],
    sportId: json["sportId"],
  );

  Map<String, dynamic> toJson() => {
    "centerName": centerName,
    "sportId": sportId,
  };
}
