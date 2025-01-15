import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zatayo/cubit/subscription_plan/buy_subscription_plan_state.dart';
import 'package:zatayo/model/common_response_model.dart';

import '../../ApiClient/api_client.dart';

class BuySubscriptionPlanCubit extends Cubit<BuySubscriptionPlanState> {
  final ApiClient apiClient;

  BuySubscriptionPlanCubit(this.apiClient)
      : super(BuySubscriptionPlanInitial());

  Future<void> buySubscriptionPlan(bodyRequest) async {
    emit(BuySubscriptionPlanLoading());
    try {
      final response = await apiClient.apiCall(
        apiEndPoint: '/customerPayment', // Example API endpoint
        data: bodyRequest
      );

      if (!kReleaseMode) {
        if (kDebugMode) {
          print(response);
        }
      }

      if (response.statusCode == 200) {
        final buySubscriptionResponse =
            CommonResponseModel.fromJson(response.data);
        if (buySubscriptionResponse.statusCode == 200) {
          emit(BuySubscriptionPlanSuccess(
              commonResponseModel: buySubscriptionResponse));
        } else {
          emit(BuySubscriptionPlanFail(
              commonResponseModel: buySubscriptionResponse));
        }
      } else {
        emit(
          BuySubscriptionPlanFail(
            commonResponseModel: CommonResponseModel(
                statusCode: 400, message: "Something went wrong"),
          ),
        );
      }
    } catch (e) {
      emit(
        BuySubscriptionPlanFail(
          commonResponseModel: CommonResponseModel(
              statusCode: 400, message: "Something went wrong"),
        ),
      );
    }
  }
}
