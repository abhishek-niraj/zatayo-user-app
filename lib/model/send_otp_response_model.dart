import 'package:json_annotation/json_annotation.dart';
part 'send_otp_response_model.g.dart';

@JsonSerializable()
class SendOtpResponseModel {
  final int? statusCode;
  final String? message;
  final String? otp;

  SendOtpResponseModel({
    this.statusCode,
    this.message,
    this.otp,
  });

  factory SendOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SendOtpResponseModelFromJson(json); // Use generated method

  Map<String, dynamic> toJson() => _$SendOtpResponseModelToJson(this); // Use generated method
}

// To parse this JSON data, do:
// final sendOtpResponseModel = SendOtpResponseModel.fromJson(jsonDecode(jsonString));
// String jsonString = jsonEncode(sendOtpResponseModel.toJson());
