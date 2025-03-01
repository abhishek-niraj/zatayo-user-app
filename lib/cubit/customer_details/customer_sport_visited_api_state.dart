import 'package:equatable/equatable.dart';
import 'package:zatayo/model/common_response_model.dart';
import 'package:zatayo/model/customer/resource_data_response_model.dart';

abstract class GetCustomerSportVisitedState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCustomerSportVisitedStateInitial
    extends GetCustomerSportVisitedState {}

class GetCustomerSportVisitedStateLoading
    extends GetCustomerSportVisitedState {}

class GetCustomerSportVisitedStateSuccess extends GetCustomerSportVisitedState {
  final ResourceDataResponseModel resourceDataResponseModel;

  GetCustomerSportVisitedStateSuccess(
      {required this.resourceDataResponseModel});

  @override
  // TODO: implement props
  List<Object?> get props => [resourceDataResponseModel];
}

class GetCustomerSportVisitedStateFail extends GetCustomerSportVisitedState {
  final CommonResponseModel commonResponseModel;

  GetCustomerSportVisitedStateFail({required this.commonResponseModel});

  @override
  List<Object?> get props => [commonResponseModel];
}
