import 'dart:ui';

class BuySubscriptionPlanScreenArgument {
  final String planName;
  final Color moneyColor;
  final Color belowBoxColor;
  final String price;
  final String subscriptionYearlyPrice;
  final int isOffer;
  final String offerDescription;
  final int trialFor;
  final String offerPerCentageOnMonth;
  final String offerPerCentageOnYear;
  final String subscriptionId;

  BuySubscriptionPlanScreenArgument(
      {required this.planName,
      required this.moneyColor,
      required this.belowBoxColor,
      required this.price,
        required this.subscriptionYearlyPrice,
        required this.isOffer,
        required this.offerDescription,
        required this.trialFor,
        required this.offerPerCentageOnMonth,
        required this.offerPerCentageOnYear,
        required this.subscriptionId
      });
}
