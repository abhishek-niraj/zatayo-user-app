import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ApiClient/api_client.dart';
import '../../model/common_response_model.dart';
import '../../model/sport/get_sports_response_model_by_sport_id.dart';
import 'get_sport_by_id_state.dart';

class GetSportByIdCubit extends Cubit<GetSportBySportIdState> {
  final ApiClient apiClient;
  GetSportsResponseModelBySportId getSportsResponseModelBySportId =
      GetSportsResponseModelBySportId();

  GetSportByIdCubit(this.apiClient) : super(GetSportBySportIdInitial());

  Future<void> fetchSports(bodyRequest) async {
    // emit(FitnessBannerLoading());
    try {
      final response = await apiClient.apiCall(
        apiEndPoint: '/merchant-sports/user/get-sport-byId', // Example API endpoint
        data: bodyRequest
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
          emit(GetSportBySportIdSuccess(
              getSportsResponseModelBySportId:
                  getSportsResponseModelBySportId));
        } else {
          final sportResponse = CommonResponseModel.fromJson(response.data);
          emit(GetSportBySportIdFail(commonResponseModel: sportResponse));
        }
      } else {
        emit(
          GetSportBySportIdFail(
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
        GetSportBySportIdFail(
          commonResponseModel: CommonResponseModel(
              statusCode: 400, message: "Something went wrong"),
        ),
      );
      rethrow;
    }
  }
}
