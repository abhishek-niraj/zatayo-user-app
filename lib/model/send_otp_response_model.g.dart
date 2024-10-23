// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendOtpResponseModel _$SendOtpResponseModelFromJson(
        Map<String, dynamic> json) =>
    SendOtpResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$SendOtpResponseModelToJson(
        SendOtpResponseModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'otp': instance.otp,
    };
