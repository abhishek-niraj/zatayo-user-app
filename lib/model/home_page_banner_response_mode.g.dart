// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_banner_response_mode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomepageBannerResponseMode _$HomepageBannerResponseModeFromJson(
        Map<String, dynamic> json) =>
    HomepageBannerResponseMode(
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$HomepageBannerResponseModeToJson(
        HomepageBannerResponseMode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };

BannerHomePageResponseModel _$BannerHomePageResponseModelFromJson(
        Map<String, dynamic> json) =>
    BannerHomePageResponseModel(
      statusCode: (json['statusCode'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              HomepageBannerResponseMode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BannerHomePageResponseModelToJson(
        BannerHomePageResponseModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'data': instance.data,
    };
