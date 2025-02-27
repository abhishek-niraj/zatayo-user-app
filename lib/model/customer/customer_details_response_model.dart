import 'package:json_annotation/json_annotation.dart';
part 'customer_details_response_model.g.dart';  // This will generate the code for serialization

@JsonSerializable()
class CustomerDetailsResponseModel {
  final int? statusCode;
  final List<CustomerDetailsData>? data;

  CustomerDetailsResponseModel({required this.statusCode, required this.data});
  factory CustomerDetailsResponseModel.fromJson(Map<String,dynamic> json)=>
      _$CustomerDetailsResponseModelFromJson(json);
  Map<String,dynamic> toJson() => _$CustomerDetailsResponseModelToJson(this);
}
@JsonSerializable()

class CustomerDetailsData {
  final int? id;
  final String? customerId;
  final String? name;
  final String? email;
  final String? mobile;
  final String? dob;
  final String? gender;
  final String? password;
  final String? profileImage;
  final String? subscriptionPlan;
  final String? role;
  final String? isAcceptReferralCode;
  final String? planName;
  final String? height;
  final String? weight;

  CustomerDetailsData({
    this.id,
    this.customerId,
    this.name,
    this.email,
    this.mobile,
    this.dob,
    this.gender,
    this.password,
    this.profileImage,
    this.subscriptionPlan,
    this.role,
    this.isAcceptReferralCode,
    this.planName,
    this.height,
    this.weight
  });
  factory CustomerDetailsData.fromJson(Map<String,dynamic> json)=>
      _$CustomerDetailsDataFromJson(json);
  Map<String,dynamic> toJson() => _$CustomerDetailsDataToJson(this);
}
