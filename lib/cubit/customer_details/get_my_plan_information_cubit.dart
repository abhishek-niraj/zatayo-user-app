import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zatayo/ApiClient/api_client.dart';
import 'package:zatayo/cubit/customer_details/get_my_plan_information_state.dart';
import 'package:zatayo/model/common_response_model.dart';
import 'package:zatayo/model/customer/get_my_plan_information_response_model.dart';
import 'package:zatayo/model/customer/resource_data_response_model.dart';

class GetMyPlanInformationCubit extends Cubit<GetMyPlanInformationState> {
  final ApiClient apiClient;
  GetMyPlanInformationResponseModel getMyPlanInformationResponseModel =
  GetMyPlanInformationResponseModel();
  CommonResponseModel commonResponseModel = CommonResponseModel();

  GetMyPlanInformationCubit(this.apiClient)
      : super(GetMyPlanInformationInitial());

  Future<void> fetchMyPlan() async {
    try {
      final response = await apiClient.apiCall(
          apiEndPoint: '/customer/get-my-plan',);
     if(!kReleaseMode){
       if (kDebugMode) {
        print("MyPlanData");
        print(response);
        print("MyPlanData");
       }
     }
      if (response.statusCode == 200) {
        final responseData = ResourceDataResponseModel.fromJson(response.data);
        if (responseData.statusCode == 200) {
          getMyPlanInformationResponseModel =
              GetMyPlanInformationResponseModel.fromJson(response.data);
          emit(GetMyPlanInformationSuccess(
              getMyPlanInformationResponseModel: getMyPlanInformationResponseModel));
        }
      } else {
        commonResponseModel = CommonResponseModel.fromJson(response.data);
        emit(GetMyPlanInformationFail(
            commonResponseModel: commonResponseModel));
      }
    } catch (err) {
      if (!kReleaseMode) {
        if (kDebugMode) {
          print(err);
        }
      }
      emit(
        GetMyPlanInformationFail(
          commonResponseModel: CommonResponseModel(
              statusCode: 400, message: "Something went wrong"),
        ),
      );
      rethrow;
    }
  }
}
