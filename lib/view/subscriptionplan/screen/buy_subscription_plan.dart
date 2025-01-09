import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/app_router.dart';
import 'package:zatayo/view/common_widget/common_app_bar_widget.dart';
import 'package:zatayo/view/common_widget/common_button_widget.dart';
import 'package:zatayo/view/common_widget/common_text_widget.dart';
import 'package:zatayo/view/subscriptionplan/screen_argumnet/buy_subscription_plan_screen_argument.dart';
import 'package:zatayo/view/subscriptionplan/widget/diamond_plan.dart';
import 'package:zatayo/view/subscriptionplan/widget/gold_plan.dart';
import 'package:zatayo/view/subscriptionplan/widget/sliver_plan.dart';
import 'package:zatayo/view/success_paymnet/screen/success_payment.dart';

import '../../common_widget/common_container_widget.dart';

class BuySubscriptionPlan extends StatefulWidget {
  static const String routeName = "/buy-subscription-plan";
  final BuySubscriptionPlanScreenArgument? planDetails;

  const BuySubscriptionPlan({this.planDetails, super.key});

  @override
  State<BuySubscriptionPlan> createState() => _BuySubscriptionPlanState();
}

class _BuySubscriptionPlanState extends State<BuySubscriptionPlan> {
  @override
  Widget build(BuildContext context) {
    print(widget.planDetails!.moneyColor);
    return Scaffold(
      appBar: AppBar(
        title: const CommonAppBarWidget(title: "Subscription"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              Colors.transparent,
              Color(0xFFB7340B),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (widget.planDetails?.planName != null &&
                        widget.planDetails!.planName.contains("Sliver"))
                      SliverPlan(
                        subscriptionPlanName: widget.planDetails!.planName,
                        price: widget.planDetails!.price,
                      ),
                    if (widget.planDetails?.planName != null &&
                        widget.planDetails!.planName.contains("Diamond"))
                      DiamondPlan(
                        subscriptionPlan:  widget.planDetails!.planName,
                        price:  widget.planDetails!.price,
                      ),
                    if (widget.planDetails?.planName != null &&
                        widget.planDetails!.planName.contains("Gold"))
                       GoldPlan(
                        subscriptionName:  widget.planDetails!.planName,
                         price:  widget.planDetails!.price,
                      ),
                    const SizedBox(
                      height: 45,
                    ),
                    const CommonTextWidget(
                      text: "50% OFF",
                      fontSize: 44,
                      fontWeight: FontWeight.w900,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const CommonTextWidget(
                      text: "Get this exclusive limited offer!",
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    SizedBox(

                      child: Stack(
                        clipBehavior: Clip.none,
                        // Ensures content can overflow the stack boundaries
                        children: [
                          // Content Container
                          Positioned(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  const Expanded(
                                    child: ContainerWidget(
                                      height: 102,
                                      borderRadius: 3,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(left: 20, top: 22),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CommonTextWidget(
                                              text: "MONTHLY",
                                              letterSpacing: 2,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 16,
                                            ),
                                            CommonTextWidget(
                                              text: "₹x.xx /month",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            CommonTextWidget(
                                              text: "No free trial",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        ContainerWidget(
                                          height: 102,
                                          borderRadius: 3,
                                          borderWidth: 3,
                                          borderColor:
                                              widget.planDetails?.belowBoxColor ??
                                                  Colors.transparent,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, top: 22),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const CommonTextWidget(
                                                  text: "YEARLY",
                                                  letterSpacing: 2,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 16,
                                                ),
                                                CommonTextWidget(
                                                  text: "₹x.xx /month",
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w800,
                                                  color:
                                                      widget.planDetails?.moneyColor ??
                                                          Colors.transparent,
                                                ),
                                                CommonTextWidget(
                                                  text: "No free trial",
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: -10, // Adjust as needed for overlap
                                          right: 23,
                                          child: ContainerWidget(
                                            borderRadius: 5,
                                            height: 30,
                                            width: 125,
                                            borderWidth: 0,
                                            borderColor: Colors.transparent,
                                            backgroundColor: Color(0xFFFE724C),
                                            child: Center(
                                                child: CommonTextWidget(
                                              text: "7-day free trial",
                                              fontWeight: FontWeight.w800,
                                              fontSize: 16,
                                            )),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0, // Adjust as needed for overlap
                                          right: 0,
                                          child: ContainerWidget(
                                            borderRadius: 5,
                                            height: 26,
                                            width: 44,
                                            borderWidth: 0,
                                            borderColor: Colors.transparent,
                                            backgroundColor:
                                                widget.planDetails?.belowBoxColor ??
                                                    Colors.transparent,
                                            child: Center(
                                                child: CommonTextWidget(
                                              text: "-xx%",
                                              fontWeight: FontWeight.w800,
                                              fontSize: 16,
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: CommonButtonWidget(
                                text: "TRY 7 DAYS AND SUBSCRIBE",
                                onPressed: () {
                                  context.push(SuccessPayment.routeName);
                                }),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
