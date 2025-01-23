import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zatayo/cubit/center/get_center_state.dart';
import 'package:zatayo/model/center/get_center_model.dart';

import '../../ApiClient/api_client.dart';
import '../../model/common_response_model.dart';

class GetCenterCubit extends Cubit<GetCenterState> {
  final ApiClient apiClient;
  GetCenterResponseModel getCenterResponseModel = GetCenterResponseModel();

  GetCenterCubit(this.apiClient) : super(GetCenterInitial());

  Future<void> fetchCenters() async {
    // emit(FitnessBannerLoading());
    try {
      final response = await apiClient.apiCallGet(
          apiEndPoint: '/center/user/get-center',
          // Example API endpoint
          );
      if (response.statusCode == 200) {
        getCenterResponseModel = GetCenterResponseModel.fromJson(response.data);

        if (!kReleaseMode) {
          if (kDebugMode) {
            print(getCenterResponseModel.toJson());
          }
        }

        if (getCenterResponseModel.statusCode == 200) {
          emit(
              GetCenterSuccess(getCenterResponseModel: getCenterResponseModel));
        } else {
          final sportResponse = CommonResponseModel.fromJson(response.data);
          emit(GetCenterFail(commonResponseModel: sportResponse));
        }
      } else {
        emit(
          GetCenterFail(
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
        GetCenterFail(
          commonResponseModel: CommonResponseModel(
              statusCode: 400, message: "Something went wrong"),
        ),
      );
      rethrow;
    }
  }
}
