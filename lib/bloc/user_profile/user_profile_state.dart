import 'package:equatable/equatable.dart';
import 'package:zatayo/model/common_response_model.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UpdateUserProfileInitial extends UserProfileState {}

class UpdateUserProfileLoading extends UserProfileState {}

class UpdateUserProfileSuccess extends UserProfileState {
  final CommonResponseModel commonResponseModel;

  const UpdateUserProfileSuccess({required this.commonResponseModel});
}

class UpdateUserProfileFail extends UserProfileState {
  final CommonResponseModel commonResponseModel;

  const UpdateUserProfileFail({required this.commonResponseModel});
}
