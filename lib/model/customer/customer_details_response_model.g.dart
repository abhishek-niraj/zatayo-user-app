// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDetailsResponseModel _$CustomerDetailsResponseModelFromJson(
        Map<String, dynamic> json) =>
    CustomerDetailsResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CustomerDetailsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomerDetailsResponseModelToJson(
        CustomerDetailsResponseModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'data': instance.data,
    };

CustomerDetailsData _$CustomerDetailsDataFromJson(Map<String, dynamic> json) =>
    CustomerDetailsData(
      id: (json['id'] as num?)?.toInt(),
      customerId: json['customerId'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      dob: json['dob'] as String?,
      gender: json['gender'] as String?,
      password: json['password'] as String?,
      profileImage: json['profileImage'] as String?,
      subscriptionPlan: json['subscriptionPlan'] as String?,
      role: json['role'] as String?,
      isAcceptReferralCode: json['isAcceptReferralCode'] as String?,
      planName: json['planName'] as String?,
    );

Map<String, dynamic> _$CustomerDetailsDataToJson(
        CustomerDetailsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'name': instance.name,
      'email': instance.email,
      'mobile': instance.mobile,
      'dob': instance.dob,
      'gender': instance.gender,
      'password': instance.password,
      'profileImage': instance.profileImage,
      'subscriptionPlan': instance.subscriptionPlan,
      'role': instance.role,
      'isAcceptReferralCode': instance.isAcceptReferralCode,
      'planName': instance.planName,
    };
