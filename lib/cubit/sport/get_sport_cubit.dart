import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zatayo/cubit/sport/get_sports_state.dart';
import 'package:zatayo/model/sport/get_sport_response_model.dart';

import '../../ApiClient/api_client.dart';
import '../../model/common_response_model.dart';

class GetSportCubit extends Cubit<GetSportsState> {
  final ApiClient apiClient;
  GetSportsResponseModel getSportsResponseModel = GetSportsResponseModel();

  GetSportCubit(this.apiClient) : super(GetSportInitial());

  Future<void> fetchSports() async {
    // emit(FitnessBannerLoading());
    try {
      final response = await apiClient.apiCall(
        apiEndPoint: '/sport/get-sport', // Example API endpoint
      );
      if (response.statusCode == 200) {
        getSportsResponseModel = GetSportsResponseModel.fromJson(response.data);

        if (!kReleaseMode) {
          if (kDebugMode) {
            print(getSportsResponseModel.toJson());
          }
        }

        if (getSportsResponseModel.statusCode == 200) {
          emit(GetSportSuccess(getSportsResponseModel: getSportsResponseModel));
        } else {
          final sportResponse = CommonResponseModel.fromJson(response.data);
          emit(GetSportFail(commonResponseModel: sportResponse));
        }
      } else {
        emit(
          GetSportFail(
            commonResponseModel: CommonResponseModel(
                statusCode: 400, message: "Something went wrong"),
          ),
        );
      }
    } catch (e) {
      if (!kReleaseMode) {
        if (kDebugMode) {
          print(e);
        }
      }
      emit(
        GetSportFail(
          commonResponseModel: CommonResponseModel(
              statusCode: 400, message: "Something went wrong"),
        ),
      );
      rethrow;
    }
  }
}
