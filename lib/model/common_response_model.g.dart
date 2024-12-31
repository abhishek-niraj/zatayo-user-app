// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonResponseModel _$CommonResponseModelFromJson(Map<String, dynamic> json) =>
    CommonResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CommonResponseModelToJson(
        CommonResponseModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
    };
