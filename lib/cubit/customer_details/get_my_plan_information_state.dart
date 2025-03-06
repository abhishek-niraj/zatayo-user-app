import 'package:equatable/equatable.dart';
import 'package:zatayo/model/common_response_model.dart';
import 'package:zatayo/model/customer/get_my_plan_information_response_model.dart';

abstract class GetMyPlanInformationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetMyPlanInformationInitial extends GetMyPlanInformationState {}

class GetMyPlanInformationLoading extends GetMyPlanInformationState {}

class GetMyPlanInformationSuccess extends GetMyPlanInformationState {
  final GetMyPlanInformationResponseModel getMyPlanInformationResponseModel;

  GetMyPlanInformationSuccess(
      {required this.getMyPlanInformationResponseModel});

  @override
  List<Object?> get props => [getMyPlanInformationResponseModel];
}

class GetMyPlanInformationFail extends GetMyPlanInformationState {
  final CommonResponseModel commonResponseModel;

  GetMyPlanInformationFail({required this.commonResponseModel});
}
