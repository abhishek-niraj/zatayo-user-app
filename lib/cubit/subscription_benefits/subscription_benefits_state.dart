import 'package:equatable/equatable.dart';
import 'package:zatayo/model/common_response_model.dart';
import 'package:zatayo/model/subscription_plan/subscription_plan_benefits_response_model.dart';
import 'package:zatayo/model/subscription_plan/subscription_plan_response_model.dart';

abstract class SubscriptionBenefitsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubscriptionBenefitsInitial extends SubscriptionBenefitsState {}

class SubscriptionBenefitsLoading extends SubscriptionBenefitsState {}

class SubscriptionBenefitsSuccess extends SubscriptionBenefitsState {
  final SubscriptionPlanBenefitsResponseModel
      subscriptionPlanBenefitsResponseModel;

  SubscriptionBenefitsSuccess(
      {required this.subscriptionPlanBenefitsResponseModel});

  @override
  List<Object?> get props => [subscriptionPlanBenefitsResponseModel];
}

class SubscriptionBenefitsFail extends SubscriptionBenefitsState {
  final CommonResponseModel commonResponseModel;

  SubscriptionBenefitsFail({required this.commonResponseModel});

  @override
  List<Object?> get props => [commonResponseModel];
}
