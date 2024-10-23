part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object?> get props => [];
}

class SendOtp extends OtpEvent {
  final String phoneNumber;

  const SendOtp(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class VerifyOtp extends OtpEvent {
  final Map<String, dynamic> bodyRequest;

  const VerifyOtp({required this.bodyRequest});

  @override
  List<Object?> get props => [bodyRequest];
}
