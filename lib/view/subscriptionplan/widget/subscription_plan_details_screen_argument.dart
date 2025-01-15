import 'dart:ui';

import '../../../model/subscription_plan/subscription_plan_benefits_response_model.dart';

class SubscriptionPlanDetailsScreenArgument {
  final String planName;
  final String titleNameOne;
  final String titleNameTwo;
  final String titleNameThree;
  final Color moneyColor;
  final Color belowBoxColor;
  final String price;
  final String? subscriptionYearlyPrice;
  final int? isOffer;
  final String? offerDescription;
  final int? trialFor;
  final String? offerPerCentageOnMonth;
  final String? offerPerCentageOnYear;
  final String ? subscriptionId;
  final List<SubscriptionPlanBenefit> subscriptionPlanBenefits;

  SubscriptionPlanDetailsScreenArgument(
      {required this.planName,
      required this.titleNameOne,
      required this.titleNameTwo,
      required this.titleNameThree,
      required this.belowBoxColor,
      required this.moneyColor,
      required this.price,
      required this.subscriptionYearlyPrice,
      required this.isOffer,
      required this.offerDescription,
      required this.trialFor,
      required this.offerPerCentageOnMonth,
      required this.offerPerCentageOnYear,
      required this.subscriptionPlanBenefits,
      required this.subscriptionId
      });
}
