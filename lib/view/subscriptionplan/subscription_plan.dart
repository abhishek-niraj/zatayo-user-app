import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/app_router.dart';
import 'package:zatayo/view/common_widget/common_app_bar_widget.dart';
import 'package:zatayo/view/subscriptionplan/screen/subscription_plan_details.dart';
import 'package:zatayo/view/subscriptionplan/widget/diamond_plan.dart';
import 'package:zatayo/view/subscriptionplan/widget/gold_plan.dart';
import 'package:zatayo/view/subscriptionplan/widget/sliver_plan.dart';
import 'package:zatayo/view/subscriptionplan/widget/subscription_plan_details_screen_argument.dart';

class SubscriptionPlan extends StatefulWidget {
  static const String routeName = "/subscription-plan";

  const SubscriptionPlan({super.key});

  @override
  State<SubscriptionPlan> createState() => _SubscriptionPlanState();
}

class _SubscriptionPlanState extends State<SubscriptionPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonAppBarWidget(title: "Subscription Plans"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF111214),
                      Color(0xFF501604),
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      InkWell(
                          onTap: () {
                            final args = SubscriptionPlanDetailsScreenArgument(
                              planName: "Sliver  Subscription",
                              titleNameOne:
                                  "All  GOLD  and  DIAMOND  gyms  &  sports",
                              titleNameTwo:
                                  "At  DIAMOND  gyms  &  GOLD  gyms  and  sports",
                              titleNameThree: "ALL  LIVE  classes",
                                moneyColor: Color(0xFF627BFC),
                                belowBoxColor: Color(0xFF9A9996)
                            );
                            context.push(SubscriptionPlanDetails.routeName,
                                extra: args);
                          },
                          child: const SliverPlan()),
                      InkWell(
                          onTap: () {
                            final args = SubscriptionPlanDetailsScreenArgument(
                              planName: "Gold  Subscription",
                              titleNameOne:
                                  "All  GOLD  and  SLIVER  gyms  &  sports",
                              titleNameTwo: "At DIAMOND gyms & sports",
                              titleNameThree: "ALL LIVE classes",
                                moneyColor: Color(0xFFFE724C),
                                belowBoxColor: Color(0xFFFFCB32)
                            );
                            context.push(SubscriptionPlanDetails.routeName,
                                extra: args);
                          },
                          child: GoldPlan()),
                      InkWell(
                          onTap: () {
                            final args = SubscriptionPlanDetailsScreenArgument(
                              planName: "Diamond  Subscription",
                              titleNameOne:
                                  "All  Sliver  and  Gold  gyms  &  sports",
                              titleNameTwo:
                                  "At  Gold  Gyms  &  PLATINUM  gyms  and  sports",
                              titleNameThree: "ALL  LIVE  classes",
                              moneyColor: Color(0xFF627BFC),
                              belowBoxColor: Color(0xFF78BAF4)
                            );
                            context.push(SubscriptionPlanDetails.routeName,
                                extra: args);
                          },
                          child: DiamondPlan())
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
