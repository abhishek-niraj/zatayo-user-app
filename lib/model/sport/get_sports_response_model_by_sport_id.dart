// To parse this JSON data, do
//
//     final getSportsResponseModelBySportId = getSportsResponseModelBySportIdFromJson(jsonString);

import 'dart:convert';

GetSportsResponseModelBySportId getSportsResponseModelBySportIdFromJson(String str) => GetSportsResponseModelBySportId.fromJson(json.decode(str));

String getSportsResponseModelBySportIdToJson(GetSportsResponseModelBySportId data) => json.encode(data.toJson());

class GetSportsResponseModelBySportId {
  final int? statusCode;
  final List<SportsDataList>? data;

  GetSportsResponseModelBySportId({
    this.statusCode,
    this.data,
  });

  GetSportsResponseModelBySportId copyWith({
    int? statusCode,
    List<SportsDataList>? data,
  }) =>
      GetSportsResponseModelBySportId(
        statusCode: statusCode ?? this.statusCode,
        data: data ?? this.data,
      );

  factory GetSportsResponseModelBySportId.fromJson(Map<String, dynamic> json) => GetSportsResponseModelBySportId(
    statusCode: json["statusCode"],
    data: json["data"] == null ? [] : List<SportsDataList>.from(json["data"]!.map((x) => SportsDataList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SportsDataList {
  final int? sportId;
  final String? newSportId;
  final String? description;
  final String? latitude;
  final String? longitude;
  final String? sportName;
  final String? locationName;
  final List<Image>? images;
  final List<EquipmentDatum>? equipmentData;

  SportsDataList({
    this.sportId,
    this.newSportId,
    this.description,
    this.latitude,
    this.longitude,
    this.sportName,
    this.locationName,
    this.images,
    this.equipmentData,
  });

  SportsDataList copyWith({
    int? sportId,
    String? newSportId,
    String? description,
    String? latitude,
    String? longitude,
    String? sportName,
    String? locationName,
    List<Image>? images,
    List<EquipmentDatum>? equipmentData,
  }) =>
      SportsDataList(
        sportId: sportId ?? this.sportId,
        newSportId: newSportId ?? this.newSportId,
        description: description ?? this.description,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        sportName: sportName ?? this.sportName,
        locationName: locationName ?? this.locationName,
        images: images ?? this.images,
        equipmentData: equipmentData ?? this.equipmentData,
      );

  factory SportsDataList.fromJson(Map<String, dynamic> json) => SportsDataList(
    sportId: json["sportId"],
    newSportId: json["newSportId"],
    description: json["description"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    sportName: json["sportName"],
    locationName: json["locationName"],
    images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
    equipmentData: json["equipmentData"] == null ? [] : List<EquipmentDatum>.from(json["equipmentData"]!.map((x) => EquipmentDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "sportId": sportId,
    "newSportId": newSportId,
    "description": description,
    "latitude": latitude,
    "longitude": longitude,
    "sportName": sportName,
    "locationName": locationName,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
    "equipmentData": equipmentData == null ? [] : List<dynamic>.from(equipmentData!.map((x) => x.toJson())),
  };
}

class EquipmentDatum {
  final String? equipment;
  final String? description;
  final int? equipmentSportId;

  EquipmentDatum({
    this.equipment,
    this.description,
    this.equipmentSportId,
  });

  EquipmentDatum copyWith({
    String? equipment,
    String? description,
    int? equipmentSportId,
  }) =>
      EquipmentDatum(
        equipment: equipment ?? this.equipment,
        description: description ?? this.description,
        equipmentSportId: equipmentSportId ?? this.equipmentSportId,
      );

  factory EquipmentDatum.fromJson(Map<String, dynamic> json) => EquipmentDatum(
    equipment: json["equipment"],
    description: json["description"],
    equipmentSportId: json["equipmentSportId"],
  );

  Map<String, dynamic> toJson() => {
    "equipment": equipment,
    "description": description,
    "equipmentSportId": equipmentSportId,
  };
}

class Image {
  final String? image;
  final int? imagesSportId;

  Image({
    this.image,
    this.imagesSportId,
  });

  Image copyWith({
    String? image,
    int? imagesSportId,
  }) =>
      Image(
        image: image ?? this.image,
        imagesSportId: imagesSportId ?? this.imagesSportId,
      );

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    image: json["image"],
    imagesSportId: json["imagesSportId"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "imagesSportId": imagesSportId,
  };
}
