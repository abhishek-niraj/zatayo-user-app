import 'package:json_annotation/json_annotation.dart';
part 'home_page_banner_response_mode.g.dart';  // This will generate the code for serialization


@JsonSerializable()
class HomepageBannerResponseMode {
  final int id;
  final String image;

  HomepageBannerResponseMode({
    required this.id,
    required this.image,
  });

  // Factory constructor for creating a BannerItem from JSON
  factory HomepageBannerResponseMode.fromJson(Map<String, dynamic> json) =>
      _$HomepageBannerResponseModeFromJson(json);

  // Method to convert BannerItem to JSON
  Map<String, dynamic> toJson() => _$HomepageBannerResponseModeToJson(this);
}


@JsonSerializable()
class BannerHomePageResponseModel {
  final int statusCode;
  final List<HomepageBannerResponseMode> data;

  BannerHomePageResponseModel({
    required this.statusCode,
    required this.data,
  });

  // Factory constructor for creating a BannerResponse from JSON
  factory BannerHomePageResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BannerHomePageResponseModelFromJson(json);

  // Method to convert BannerResponse to JSON
  Map<String, dynamic> toJson() => _$BannerHomePageResponseModelToJson(this);
}
