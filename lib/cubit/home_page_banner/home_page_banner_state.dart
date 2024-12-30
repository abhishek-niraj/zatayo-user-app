import 'package:equatable/equatable.dart';
import 'package:zatayo/model/common_response_model.dart';
import 'package:zatayo/model/home_page_banner_response_mode.dart';

abstract class HomePageBannerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomePageBannerInitial extends HomePageBannerState {}

class HomePageBannerLoading extends HomePageBannerState {}

class HomePageBannerSuccess extends HomePageBannerState {
  final BannerHomePageResponseModel bannerHomePageResponseModel;

  HomePageBannerSuccess({
    required this.bannerHomePageResponseModel
});

  @override
  List<Object?> get props => [bannerHomePageResponseModel];
}

class HomePageBannerFail extends HomePageBannerState {
  final  CommonResponseModel commonResponseModel;

  HomePageBannerFail({
    required this.commonResponseModel
});

  @override
  List<Object?> get props => [commonResponseModel];
}
