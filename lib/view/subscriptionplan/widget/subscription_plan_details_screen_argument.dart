import 'dart:ui';

class SubscriptionPlanDetailsScreenArgument {
  final String planName;
  final String titleNameOne;
  final String titleNameTwo;
  final String titleNameThree;
  final Color moneyColor;
  final Color belowBoxColor;

  SubscriptionPlanDetailsScreenArgument(
      {required this.planName,
      required this.titleNameOne,
      required this.titleNameTwo,
      required this.titleNameThree,
      required this.belowBoxColor,
      required this.moneyColor});
}
