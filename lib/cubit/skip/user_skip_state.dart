import 'package:equatable/equatable.dart';
import 'package:zatayo/model/common_response_model.dart';

import '../../model/otp_verify_response_model.dart';

abstract class UserSkipState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserSkipInitial extends UserSkipState {}

class UserSkipLoading extends UserSkipState {}

class UserSkipSuccess extends UserSkipState {
  final OtpVerifyResponseModel otpVerifyResponseModel;
  UserSkipSuccess({required this.otpVerifyResponseModel});
  @override
  // TODO: implement props
  List<Object?> get props => [otpVerifyResponseModel];
}

class UserSkipFail extends UserSkipState {
  final CommonResponseModel commonResponseModel;
  UserSkipFail({required this.commonResponseModel});
  @override
  // TODO: implement props
  List<Object?> get props => [commonResponseModel];
}
