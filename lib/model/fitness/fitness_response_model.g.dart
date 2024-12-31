// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fitness_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FitnessResponseModel _$FitnessResponseModelFromJson(
        Map<String, dynamic> json) =>
    FitnessResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FitnessDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FitnessResponseModelToJson(
        FitnessResponseModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'data': instance.data,
    };

FitnessDataModel _$FitnessDataModelFromJson(Map<String, dynamic> json) =>
    FitnessDataModel(
      fitnessId: (json['fitnessId'] as num?)?.toInt(),
      description: json['description'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      name: json['name'] as String?,
      locationName: json['locationName'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      equipmentData: (json['equipmentData'] as List<dynamic>?)
          ?.map((e) => EquipmentDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FitnessDataModelToJson(FitnessDataModel instance) =>
    <String, dynamic>{
      'fitnessId': instance.fitnessId,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'name': instance.name,
      'locationName': instance.locationName,
      'images': instance.images,
      'equipmentData': instance.equipmentData,
    };

EquipmentDatum _$EquipmentDatumFromJson(Map<String, dynamic> json) =>
    EquipmentDatum(
      equipment: json['equipment'] as String?,
      description: json['description'] as String?,
      equipmentFitnessId: (json['equipmentFitnessId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EquipmentDatumToJson(EquipmentDatum instance) =>
    <String, dynamic>{
      'equipment': instance.equipment,
      'description': instance.description,
      'equipmentFitnessId': instance.equipmentFitnessId,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      image: json['image'] as String?,
      imagesFitnessId: (json['imagesFitnessId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'image': instance.image,
      'imagesFitnessId': instance.imagesFitnessId,
    };
