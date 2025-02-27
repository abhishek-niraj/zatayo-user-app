import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zatayo/cubit/customer_details/customer_details_state.dart';
import 'package:zatayo/model/customer/customer_details_response_model.dart';

import '../../ApiClient/api_client.dart';
import '../../model/common_response_model.dart';

class CustomerDetailsCubit extends Cubit<CustomerDetailsState> {
  final ApiClient apiClient;
  CustomerDetailsCubit(this.apiClient) : super(GetCustomerDetailInitial());

  Future<void> fetchCustomerDetails() async {
    // emit(FitnessBannerLoading());
    try {
      final response = await apiClient.apiCall(
          apiEndPoint: '/customer/get-customer', // Example API endpoint
          );
      print(response.data);
      final bannerResponse =
          CustomerDetailsResponseModel.fromJson(response.data);

      if (!kReleaseMode) {
        if (kDebugMode) {
          print(bannerResponse.toJson());
        }
      }

      if (bannerResponse.statusCode == 200) {
        emit(GetCustomerDetailSuccess(
            customerDetailsResponseModel: bannerResponse));
      } else {
        final bannerResponse = CommonResponseModel.fromJson(response.data);
        emit(GetCustomerDetailFail(commonResponseModel: bannerResponse));
      }
    } catch (e) {
      emit(
        GetCustomerDetailFail(
          commonResponseModel: CommonResponseModel(
              statusCode: 400, message: "Something went wrong"),
        ),
      );
      rethrow;
    }
  }
}
