import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zatayo/cubit/skip/user_skip_state.dart';
import 'package:zatayo/model/otp_verify_response_model.dart';

import '../../ApiClient/api_client.dart';
import '../../model/common_response_model.dart';

class UserSkipCubit extends Cubit<UserSkipState> {
  final ApiClient apiClient;
  OtpVerifyResponseModel otpVerifyResponseModel = OtpVerifyResponseModel();

  UserSkipCubit(this.apiClient) : super(UserSkipInitial());

  Future<void> skipLogin() async {
    emit(UserSkipLoading());
    try {
      final response = await apiClient.apiCallGet(
          apiEndPoint:
              '/customer/skip-user', // Example API endpoint
          );
      if (response.statusCode == 200) {
        otpVerifyResponseModel = OtpVerifyResponseModel.fromJson(response.data);

        if (!kReleaseMode) {
          if (kDebugMode) {
            print(otpVerifyResponseModel.toJson());
          }
        }

        if (otpVerifyResponseModel.statusCode == 200) {
          emit(UserSkipSuccess(otpVerifyResponseModel: otpVerifyResponseModel));
        } else {
          final commonResponseModel =
              CommonResponseModel.fromJson(response.data);
          emit(UserSkipFail(commonResponseModel: commonResponseModel));
        }
      } else {
        emit(
          UserSkipFail(
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
        UserSkipFail(
          commonResponseModel: CommonResponseModel(
              statusCode: 400, message: "Something went wrong"),
        ),
      );
      rethrow;
    }
  }
}
