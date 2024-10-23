// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_verify_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpVerifyResponseModel _$OtpVerifyResponseModelFromJson(
        Map<String, dynamic> json) =>
    OtpVerifyResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      token: json['token'] as String?,
      id: json['id'] as String?,
      role: json['role'] as String?,
      subscriptionPlan: json['subscriptionPlan'] as String?,
    );

Map<String, dynamic> _$OtpVerifyResponseModelToJson(
        OtpVerifyResponseModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'token': instance.token,
      'id': instance.id,
      'role': instance.role,
      'subscriptionPlan': instance.subscriptionPlan,
    };
