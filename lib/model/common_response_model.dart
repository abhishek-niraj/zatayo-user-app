import 'package:json_annotation/json_annotation.dart';
part 'common_response_model.g.dart';

@JsonSerializable()
class CommonResponseModel {
  int? statusCode;
  String? message;

  CommonResponseModel({
    this.statusCode,
    this.message,
  });

  factory CommonResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CommonResponseModelFromJson(json); // Use generated method

  Map<String, dynamic> toJson() => _$CommonResponseModelToJson(this); // Use generated method
}