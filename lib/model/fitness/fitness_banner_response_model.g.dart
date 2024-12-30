// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fitness_banner_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FitnessBannerResponseModel _$FitnessBannerResponseModelFromJson(
        Map<String, dynamic> json) =>
    FitnessBannerResponseModel(
      statusCode: (json['statusCode'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => FitnessBannerDataList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FitnessBannerResponseModelToJson(
        FitnessBannerResponseModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'data': instance.data,
    };

FitnessBannerDataList _$FitnessBannerDataListFromJson(
        Map<String, dynamic> json) =>
    FitnessBannerDataList(
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$FitnessBannerDataListToJson(
        FitnessBannerDataList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };
