import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zatayo/cubit/fitness_banner/fitness_banner_state.dart';
import 'package:zatayo/model/fitness/fitness_banner_response_model.dart';

import '../../ApiClient/api_client.dart';
import '../../model/common_response_model.dart';

class FitnessBannerCubit extends Cubit<FitnessBannerState> {
  final ApiClient apiClient;

  FitnessBannerCubit(this.apiClient) : super(FitnessBannerInitial());

  Future<void> fetchFitnessBanners(Map<String, dynamic> bodyRequest) async {
    emit(FitnessBannerLoading());
    try {
      final response = await apiClient.apiCall(
          apiEndPoint: '/banner/user/get-banner-item', // Example API endpoint
          data: bodyRequest);
      final bannerResponse = FitnessBannerResponseModel.fromJson(response.data);

      if (!kReleaseMode) {
        if (kDebugMode) {
          print(bannerResponse.toJson());
        }
      }

      if (bannerResponse.statusCode == 200) {
        emit(FitnessBannerSuccess(fitnessBannerResponseModel: bannerResponse));
      } else {
        final bannerResponse = CommonResponseModel.fromJson(response.data);
        emit(FitnessBannerFail(commonResponseModel: bannerResponse));
      }
    } catch (e) {
      emit(
        FitnessBannerFail(
          commonResponseModel: CommonResponseModel(
              statusCode: 400, message: "Something went wrong"),
        ),
      );
    }
  }
}
