

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zatayo/cubit/home_page_banner/home_page_banner_state.dart';

import '../../ApiClient/api_client.dart';
import '../../model/common_response_model.dart';
import '../../model/home_page_banner_response_mode.dart';

class HomePageBannerCubit extends Cubit<HomePageBannerState> {
  final ApiClient apiClient;

  HomePageBannerCubit(this.apiClient) : super(HomePageBannerInitial());

  Future<void> fetchBanners(Map<String,dynamic> bodyRequest) async {
    emit(HomePageBannerLoading());
    try {
      final response = await apiClient.apiCall(
        apiEndPoint: '/banner/user/get-banner-item', // Example API endpoint
        data: bodyRequest
      );
      final bannerResponse = BannerHomePageResponseModel.fromJson(response.data);

      if(!kReleaseMode){
        if (kDebugMode) {
          print(bannerResponse.toJson());
        }
      }

      if(bannerResponse.statusCode == 200){
        emit(HomePageBannerSuccess(bannerHomePageResponseModel: bannerResponse));

      }else{
        final bannerResponse = CommonResponseModel.fromJson(response.data);
        emit(HomePageBannerFail(commonResponseModel: bannerResponse));
      }

    } catch (e) {
      emit(HomePageBannerFail(commonResponseModel: CommonResponseModel(
          statusCode: 400,
          message: "Something went wrong"
      ),),);
    }
  }
}
