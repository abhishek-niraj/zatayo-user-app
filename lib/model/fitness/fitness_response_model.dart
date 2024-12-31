import 'package:json_annotation/json_annotation.dart';
part 'fitness_response_model.g.dart';  // This will generate the code for serialization

@JsonSerializable()
class FitnessResponseModel {
  final int? statusCode;
  final List<FitnessDataModel>? data;

  FitnessResponseModel({
    this.statusCode,
    this.data,
  });
  factory FitnessResponseModel.fromJson(Map<String,dynamic> json)=>
      _$FitnessResponseModelFromJson(json);
  Map<String,dynamic> toJson() => _$FitnessResponseModelToJson(this);

}

@JsonSerializable()
class FitnessDataModel {
  final int? fitnessId;
  final String? description;
  final String? latitude;
  final String? longitude;
  final String? name;
  final String? locationName;
  final List<Image>? images;
  final List<EquipmentDatum>? equipmentData;

  FitnessDataModel({
    this.fitnessId,
    this.description,
    this.latitude,
    this.longitude,
    this.name,
    this.locationName,
    this.images,
    this.equipmentData,
  });
  factory FitnessDataModel.fromJson(Map<String,dynamic> json)=>
      _$FitnessDataModelFromJson(json);
  Map<String,dynamic> toJson() => _$FitnessDataModelToJson(this);
}
@JsonSerializable()
class EquipmentDatum {
  final String? equipment;
  final String? description;
  final int? equipmentFitnessId;

  EquipmentDatum({
    this.equipment,
    this.description,
    this.equipmentFitnessId,
  });
  factory EquipmentDatum.fromJson(Map<String,dynamic> json)=>
      _$EquipmentDatumFromJson(json);
  Map<String,dynamic> toJson() => _$EquipmentDatumToJson(this);
}
@JsonSerializable()
class Image {
  final String? image;
  final int? imagesFitnessId;

  Image({
    this.image,
    this.imagesFitnessId,
  });
  factory Image.fromJson(Map<String,dynamic> json)=>
      _$ImageFromJson(json);
  Map<String,dynamic> toJson() => _$ImageToJson(this);
}