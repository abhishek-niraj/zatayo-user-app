import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zatayo/ApiClient/api_client.dart';
import 'package:zatayo/model/common_response_model.dart';
import 'package:zatayo/model/customer/resource_data_response_model.dart';

import 'customer_sport_visited_api_state.dart';

class CustomerSportVisitedBloc extends Cubit<GetCustomerSportVisitedState> {
  final ApiClient apiClient;
  ResourceDataResponseModel resourceDataResponseModel =
      ResourceDataResponseModel();
  CommonResponseModel commonResponseModel = CommonResponseModel();

  CustomerSportVisitedBloc(this.apiClient)
      : super(GetCustomerSportVisitedStateInitial());

  Future<void> fetchCustomerSportVisited(bodyRequest) async {
    try {
      final response = await apiClient.apiCall(
          apiEndPoint: '/timeSheet/sport-visited', data: bodyRequest);
      if (response.statusCode == 200) {
        final responseData = ResourceDataResponseModel.fromJson(response.data);
        if (responseData.statusCode == 200) {
          resourceDataResponseModel =
              ResourceDataResponseModel.fromJson(response.data);
          emit(GetCustomerSportVisitedStateSuccess(
              resourceDataResponseModel: resourceDataResponseModel));
        }
      } else {
        commonResponseModel = CommonResponseModel.fromJson(response.data);
        emit(GetCustomerSportVisitedStateFail(
            commonResponseModel: commonResponseModel));
      }
    } catch (err) {
      if (!kReleaseMode) {
        if (kDebugMode) {
          print(err);
        }
      }
      emit(
        GetCustomerSportVisitedStateFail(
          commonResponseModel: CommonResponseModel(
              statusCode: 400, message: "Something went wrong"),
        ),
      );
      rethrow;
    }
  }
}
