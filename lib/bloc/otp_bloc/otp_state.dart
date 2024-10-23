part of 'otp_bloc.dart';

abstract class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object?> get props => [];
}

class OtpInitial extends OtpState {}

class OtpLoading extends OtpState {}

class OtpSentSuccess extends OtpState {
  final SendOtpResponseModel sendOtpResponseModel;

  const OtpSentSuccess(this.sendOtpResponseModel);

  @override
  List<Object?> get props => [sendOtpResponseModel];
}

class OtpError extends OtpState {
  final String message;

  const OtpError(this.message);

  @override
  List<Object?> get props => [message];
}

class VerifyOtpInitial extends OtpState {}

class VerifyOtpLoading extends OtpState {}

class VerifyOtpSuccess extends OtpState {
  final OtpVerifyResponseModel otpVerifyResponseModel;

  const VerifyOtpSuccess({required this.otpVerifyResponseModel});

  @override
  List<Object?> get props => [otpVerifyResponseModel];
}

class VerifyOtpFail extends OtpState {
  final CommonResponseModel commonResponseModel;

  const VerifyOtpFail({required this.commonResponseModel});

  @override
  List<Object?> get props => [commonResponseModel];
}
