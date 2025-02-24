// To parse this JSON data, do
//
//     final userSelectedLocationInformationCubitModel = userSelectedLocationInformationCubitModelFromJson(jsonString);

import 'dart:convert';

UserSelectedLocationInformationCubitModel
    userSelectedLocationInformationCubitModelFromJson(String str) =>
        UserSelectedLocationInformationCubitModel.fromJson(json.decode(str));

String userSelectedLocationInformationCubitModelToJson(
        UserSelectedLocationInformationCubitModel data) =>
    json.encode(data.toJson());

class UserSelectedLocationInformationCubitModel {
  final String? cityName;
  final String? stateName;
  final String? selectedSportId;

  UserSelectedLocationInformationCubitModel({
    this.cityName,
    this.stateName,
    this.selectedSportId,
  });

  UserSelectedLocationInformationCubitModel copyWith({
    String? cityName,
    String? stateName,
    String? selectedSportId,
  }) =>
      UserSelectedLocationInformationCubitModel(
          cityName: cityName ?? this.cityName,
          stateName: stateName ?? this.stateName,
          selectedSportId: selectedSportId ?? this.selectedSportId);

  factory UserSelectedLocationInformationCubitModel.fromJson(
          Map<String, dynamic> json) =>
      UserSelectedLocationInformationCubitModel(
          cityName: json["cityName"],
          stateName: json["stateName"],
          selectedSportId: json["selectedSportId"]);

  Map<String, dynamic> toJson() => {
        "cityName": cityName,
        "stateName": stateName,
        "selectedSportId": selectedSportId
      };
}
