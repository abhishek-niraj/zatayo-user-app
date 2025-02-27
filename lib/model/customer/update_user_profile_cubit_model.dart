// To parse this JSON data, do
//
//     final updateUserProfileCubitModel = updateUserProfileCubitModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/services.dart';

UpdateUserProfileCubitModel updateUserProfileCubitModelFromJson(String str) =>
    UpdateUserProfileCubitModel.fromJson(json.decode(str));

String updateUserProfileCubitModelToJson(UpdateUserProfileCubitModel data) =>
    json.encode(data.toJson());

class UpdateUserProfileCubitModel {
  final String? name;
  final String? dob;
  final String? gender;
  final String? height;
  final String? weight;
  final bool? isGetData;
  final Uint8List? userProfileImage;

  UpdateUserProfileCubitModel(
      {this.name,
      this.dob,
      this.gender,
      this.height,
      this.weight,
      this.isGetData,
      this.userProfileImage});

  UpdateUserProfileCubitModel copyWith(
          {String? name,
          String? dob,
          String? gender,
          String? height,
          String? weight,
          bool? isGetData,
          Uint8List? userProfileImage}) =>
      UpdateUserProfileCubitModel(
          name: name ?? this.name,
          dob: dob ?? this.dob,
          gender: gender ?? this.gender,
          height: height ?? this.height,
          weight: weight ?? this.weight,
          isGetData: isGetData ?? this.isGetData,
          userProfileImage: userProfileImage ?? this.userProfileImage);

  factory UpdateUserProfileCubitModel.fromJson(Map<String, dynamic> json) =>
      UpdateUserProfileCubitModel(
          name: json["name"],
          dob: json["dob"],
          gender: json["gender"],
          height: json["height"],
          weight: json["weight"],
          isGetData: json['isGetData'],
          userProfileImage: json['userProfileImage']);

  Map<String, dynamic> toJson() => {
        "name": name,
        "dob": dob,
        "gender": gender,
        "height": height,
        "weight": weight,
        'isGetData': isGetData,
        'userProfileImage': userProfileImage
      };
}
