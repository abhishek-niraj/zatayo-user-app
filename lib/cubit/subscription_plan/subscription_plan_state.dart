import 'package:equatable/equatable.dart';
import 'package:zatayo/model/subscription_plan/subscription_plan_response_model.dart';

import '../../model/common_response_model.dart';

abstract class SubscriptionPlanState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubscriptionPlanInitial extends SubscriptionPlanState {}

class SubscriptionPlanLoading extends SubscriptionPlanState {}

class SubscriptionPlanSuccess extends SubscriptionPlanState {
  final SubscriptionPlanResponseModel subscriptionPlanResponseModel;
  SubscriptionPlanSuccess({
    required this.subscriptionPlanResponseModel
});
  @override
  List<Object?> get props => [subscriptionPlanResponseModel];
}

class SubscriptionPlanFail extends SubscriptionPlanState {
  final  CommonResponseModel commonResponseModel;
  SubscriptionPlanFail({
    required this.commonResponseModel
  });

  @override
  List<Object?> get props => [commonResponseModel];
}
