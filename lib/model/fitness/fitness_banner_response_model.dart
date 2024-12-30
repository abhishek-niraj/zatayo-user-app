import 'package:json_annotation/json_annotation.dart';
part 'fitness_banner_response_model.g.dart';  // This will generate the code for serialization

@JsonSerializable()
class FitnessBannerResponseModel {
  final int statusCode;
  final List<FitnessBannerDataList> data;

  FitnessBannerResponseModel({required this.statusCode, required this.data});

  factory FitnessBannerResponseModel.fromJson(Map<String,dynamic> json)=>
      _$FitnessBannerResponseModelFromJson(json);
  Map<String,dynamic> toJson() => _$FitnessBannerResponseModelToJson(this);
}

@JsonSerializable()
class FitnessBannerDataList {
  final int id;
  final String image;

  FitnessBannerDataList({required this.id, required this.image});
  factory FitnessBannerDataList.fromJson(Map<String,dynamic>json) =>
      _$FitnessBannerDataListFromJson(json);
  Map<String,dynamic> toJson() => _$FitnessBannerDataListToJson(this);
}
