import 'package:equatable/equatable.dart';
import 'package:zatayo/model/common_response_model.dart';

abstract class BuySubscriptionPlanState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BuySubscriptionPlanInitial extends BuySubscriptionPlanState {}

class BuySubscriptionPlanLoading extends BuySubscriptionPlanState {}

class BuySubscriptionPlanSuccess extends BuySubscriptionPlanState {
  final CommonResponseModel commonResponseModel;

  BuySubscriptionPlanSuccess({required this.commonResponseModel});

  @override
  List<Object?> get props => [commonResponseModel];
}

class BuySubscriptionPlanFail extends BuySubscriptionPlanState {
  final CommonResponseModel commonResponseModel;

  BuySubscriptionPlanFail({required this.commonResponseModel});

  @override
  List<Object?> get props => [commonResponseModel];
}
