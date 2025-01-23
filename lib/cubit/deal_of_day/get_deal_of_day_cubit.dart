import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ApiClient/api_client.dart';
import '../../model/common_response_model.dart';
import '../../model/deal_of_day/get_deal_of_day_response_model.dart';
import 'get_deal_of_day_state.dart';

class GetDealOfDayCubit extends Cubit<GetDealOfDayState> {
  final ApiClient apiClient;
  GetDealOfDayResponseModel getDealOfDayResponseModel =
      GetDealOfDayResponseModel();

  GetDealOfDayCubit(this.apiClient) : super(GetDealDayInitial());

  Future<void> fetchDealOfDay() async {
    // emit(FitnessBannerLoading());
    try {
      final response = await apiClient.apiCallGet(
          apiEndPoint: '/deal-of-day/user/get-deal-of-day',
          // Example API endpoint
         );
      if (response.statusCode == 200) {
        getDealOfDayResponseModel =
            GetDealOfDayResponseModel.fromJson(response.data);

        if (!kReleaseMode) {
          if (kDebugMode) {
            print(getDealOfDayResponseModel.toJson());
          }
        }

        if (getDealOfDayResponseModel.statusCode == 200) {
          emit(GetDealDaySuccess(
              getDealOfDayResponseModel: getDealOfDayResponseModel));
        } else {
          final sportResponse = CommonResponseModel.fromJson(response.data);
          emit(GetDealDayFail(commonResponseModel: sportResponse));
        }
      } else {
        emit(
          GetDealDayFail(
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
        GetDealDayFail(
          commonResponseModel: CommonResponseModel(
              statusCode: 400, message: "Something went wrong"),
        ),
      );
      rethrow;
    }
  }
}
