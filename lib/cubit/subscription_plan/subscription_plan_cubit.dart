import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zatayo/cubit/subscription_plan/subscription_plan_state.dart';
import 'package:zatayo/model/common_response_model.dart';
import 'package:zatayo/model/subscription_plan/subscription_plan_response_model.dart';

import '../../ApiClient/api_client.dart';

class SubscriptionPlanCubit extends Cubit<SubscriptionPlanState> {
  final ApiClient apiClient;

  SubscriptionPlanCubit(this.apiClient) : super(SubscriptionPlanInitial());

  Future<void> fetchSubscriptionPlan() async {
    // emit(HomePageBannerLoading());
    try {
      final response = await apiClient.apiCall(
          apiEndPoint: '/subscription/get-subscription', // Example API endpoint
          );
      final subscriptionPlanResponse =
          SubscriptionPlanResponseModel.fromJson(response.data);

      if (!kReleaseMode) {
        if (kDebugMode) {
          print(subscriptionPlanResponse.toJson());
        }
      }

      if (subscriptionPlanResponse.statusCode == 200) {
        final bannerResponse = CommonResponseModel.fromJson(response.data);
        if (bannerResponse.statusCode == 200) {
          emit(SubscriptionPlanSuccess(
              subscriptionPlanResponseModel: subscriptionPlanResponse));
        } else {
          emit(SubscriptionPlanFail(commonResponseModel: bannerResponse));
        }
      } else {
        emit(
          SubscriptionPlanFail(
            commonResponseModel: CommonResponseModel(
                statusCode: 400, message: "Something went wrong"),
          ),
        );
      }
    } catch (e) {
      emit(
        SubscriptionPlanFail(
          commonResponseModel: CommonResponseModel(
              statusCode: 400, message: "Something went wrong"),
        ),
      );
    }
  }
}
