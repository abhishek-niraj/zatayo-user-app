import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zatayo/cubit/subscription_benefits/subscription_benefits_state.dart';
import 'package:zatayo/model/common_response_model.dart';

import '../../ApiClient/api_client.dart';
import '../../model/subscription_plan/subscription_plan_benefits_response_model.dart';

class SubscriptionBenefitsCubit extends Cubit<SubscriptionBenefitsState> {
  final ApiClient apiClient;

  SubscriptionBenefitsCubit(this.apiClient)
      : super(SubscriptionBenefitsInitial());

  Future<void> getSubscriptionBenefits() async {
    // emit(HomePageBannerLoading());
    try {
      final response = await apiClient.apiCallGet(
        apiEndPoint: '/subscriptionBenefits/user/get-subscription-benefits', // Example API endpoint
      );

      if (!kReleaseMode) {
        if (kDebugMode) {
          print(response);
        }
      }

      if (response.statusCode == 200) {
        final subscriptionPlanBenefitsResponseModel =
            SubscriptionPlanBenefitsResponseModel.fromJson(response.data);
        if (subscriptionPlanBenefitsResponseModel.statusCode == 200) {
          emit(SubscriptionBenefitsSuccess(
              subscriptionPlanBenefitsResponseModel:
                  subscriptionPlanBenefitsResponseModel));
        } else {
          final commonResponseModel =
              CommonResponseModel.fromJson(response.data);
          emit(SubscriptionBenefitsFail(
              commonResponseModel: commonResponseModel));
        }
      } else {
        emit(
          SubscriptionBenefitsFail(
            commonResponseModel: CommonResponseModel(
                statusCode: 400, message: "Something went wrong"),
          ),
        );
      }
    } catch (e) {
      emit(
        SubscriptionBenefitsFail(
          commonResponseModel: CommonResponseModel(
              statusCode: 400, message: "Something went wrong"),
        ),
      );
      rethrow;
    }
  }
}
