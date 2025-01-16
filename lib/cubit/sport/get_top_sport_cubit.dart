import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zatayo/cubit/sport/get_top_sport_state.dart';

import '../../ApiClient/api_client.dart';
import '../../model/common_response_model.dart';
import '../../model/sport/get_sports_response_model_by_sport_id.dart';

class GetTopSportCubit extends Cubit<GetTopSportState> {
  final ApiClient apiClient;
  GetSportsResponseModelBySportId getSportsResponseModelBySportId =
      GetSportsResponseModelBySportId();

  GetTopSportCubit(this.apiClient) : super(GetTopSportInitial());

  Future<void> fetchTopSports() async {
    // emit(FitnessBannerLoading());
    try {
      final response = await apiClient.apiCallGet(
          apiEndPoint: '/merchant-sports/user/get-top-sports',
          // Example API endpoint
          );
      if (response.statusCode == 200) {
        getSportsResponseModelBySportId =
            GetSportsResponseModelBySportId.fromJson(response.data);

        if (!kReleaseMode) {
          if (kDebugMode) {
            print(getSportsResponseModelBySportId.toJson());
          }
        }

        if (getSportsResponseModelBySportId.statusCode == 200) {
          emit(GetTopSportSuccess(
              getSportsResponseModelBySportId:
                  getSportsResponseModelBySportId));
        } else {
          final sportResponse = CommonResponseModel.fromJson(response.data);
          emit(GetTopSportFail(commonResponseModel: sportResponse));
        }
      } else {
        emit(
          GetTopSportFail(
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
        GetTopSportFail(
          commonResponseModel: CommonResponseModel(
              statusCode: 400, message: "Something went wrong"),
        ),
      );
      rethrow;
    }
  }
}
