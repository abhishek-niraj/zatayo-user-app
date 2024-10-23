import 'package:json_annotation/json_annotation.dart';
part 'otp_verify_response_model.g.dart';

@JsonSerializable()
class OtpVerifyResponseModel {
  int? statusCode;
  String? message;
  String? token;
  String? id;
  String? role;
  String? subscriptionPlan;

  OtpVerifyResponseModel({
    this.statusCode,
    this.message,
    this.token,
    this.id,
    this.role,
    this.subscriptionPlan,
  });
  factory OtpVerifyResponseModel.fromJson(Map<String,dynamic>json)=>
      _$OtpVerifyResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$OtpVerifyResponseModelToJson(this); // Use generated method

}