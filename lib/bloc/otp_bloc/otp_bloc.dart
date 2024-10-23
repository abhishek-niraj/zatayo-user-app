import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zatayo/model/common_response_model.dart';
import 'package:zatayo/model/otp_verify_response_model.dart';
import '../../ApiClient/api_client.dart';
import '../../model/send_otp_response_model.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final ApiClient apiClient;

  OtpBloc(this.apiClient) : super(OtpInitial()) {
    on<SendOtp>((event, emit) async {
      emit(OtpLoading()); // Emit loading state
      try {
        final responseMap = await apiClient.sendOtp(event.phoneNumber);

        // Parse the response into the model
        final response = SendOtpResponseModel.fromJson(responseMap.data);
        emit(OtpSentSuccess(response)); // Emit success state with parsed model
      } catch (e) {

        emit(const OtpError("Failed to send OTP")); // Emit error state
      }
    });
    on<VerifyOtp>((event, emit) async {
      emit(VerifyOtpLoading()); // Emit loading state
      try {
        final responseMap = await apiClient.apiCall(
          apiEndPoint: "/customer/verify-otp",
          data: event.bodyRequest
        );

        // Parse the response into the model
        final response = OtpVerifyResponseModel.fromJson(responseMap.data);

        if(response.statusCode == 200){
          emit(VerifyOtpSuccess(otpVerifyResponseModel: response));
        }else{
          final response = CommonResponseModel.fromJson(responseMap.data);
          emit(VerifyOtpFail(commonResponseModel: response));
        }
        // Emit success state with parsed model
      } catch (e) {
        emit(VerifyOtpFail(commonResponseModel: CommonResponseModel(
          statusCode: 400,
          message: "Something went wrong"
        )));
      }
    });
  }
}
