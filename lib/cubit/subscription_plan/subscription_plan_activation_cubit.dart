import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zatayo/cubit/subscription_plan/subscription_plan_activation_state.dart';
import 'package:zatayo/model/common_response_model.dart';

import '../../ApiClient/api_client.dart';

class SubscriptionPlanActivationCubit
    extends Cubit<SubscriptionPlanActivationState> {
  final ApiClient apiClient;
  CommonResponseModel commonResponseModel = CommonResponseModel();

  SubscriptionPlanActivationCubit(this.apiClient)
      : super(InitialActivationPlan());

  Future<void> activateSubscriptionPlan(bodyRequest) async {
    emit(LoadingActivationPlan());
    try {
      final response = await apiClient.apiCall(
        apiEndPoint: '/customer/update-my-plan', // Example API endpoint
        data: bodyRequest
      );

      if (response.statusCode == 200) {
        commonResponseModel = CommonResponseModel.fromJson(response.data);
        if (commonResponseModel.statusCode == 200) {
          print("000000000000000");
          emit(SuccessActivationPlan(commonResponseModel: commonResponseModel));
        } else {
          emit(FailActivationPlan(commonResponseModel: commonResponseModel));
        }
      } else {
        emit(
          FailActivationPlan(
            commonResponseModel: CommonResponseModel(
                statusCode: 400, message: "Something went wrong"),
          ),
        );
      }
    } catch (e) {
      emit(
        FailActivationPlan(
          commonResponseModel: CommonResponseModel(
              statusCode: 400, message: "Something went wrong"),
        ),
      );
    }
  }
}
