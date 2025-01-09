import 'dart:ui';

class BuySubscriptionPlanScreenArgument {
  final String planName;
  final Color moneyColor;
  final Color belowBoxColor;
  final String price;


  BuySubscriptionPlanScreenArgument(
      {required this.planName,
      required this.moneyColor,
      required this.belowBoxColor,
      required this.price
      });
}
