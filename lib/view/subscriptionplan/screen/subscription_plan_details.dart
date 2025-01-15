import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/app_router.dart';
import 'package:zatayo/constant/app_color.dart';
import 'package:zatayo/model/subscription_plan/subscription_plan_benefits_response_model.dart';
import 'package:zatayo/view/common_widget/common_button_widget.dart';
import 'package:zatayo/view/common_widget/common_text_widget.dart';
import 'package:zatayo/view/subscriptionplan/screen/buy_subscription_plan.dart';
import 'package:zatayo/view/subscriptionplan/screen_argumnet/buy_subscription_plan_screen_argument.dart';

import '../../common_widget/common_container_widget.dart';
import '../widget/subscription_plan_details_screen_argument.dart';

class SubscriptionPlanDetails extends StatefulWidget {
  static const routeName = "/subscription-plan-details";
  final SubscriptionPlanDetailsScreenArgument? planDetails;

  const SubscriptionPlanDetails({this.planDetails, super.key});

  @override
  State<SubscriptionPlanDetails> createState() =>
      _SubscriptionPlanDetailsState();
}

class _SubscriptionPlanDetailsState extends State<SubscriptionPlanDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF381004),
              Color(0xFFB7340B),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 54,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonTextWidget(
                                text: widget.planDetails?.planName ?? '',
                                fontWeight: FontWeight.w700,
                                fontSize: 26,
                                color: const Color(0xFFF97316),
                              ),
                              Image.asset("assets/images/sliver.png")
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        ContainerWidget(
                                          width: 30,
                                          height: 30,
                                          borderRadius: 45,
                                          backgroundColor: Colors.white,
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CommonTextWidget(
                                              text: widget
                                                      .planDetails!
                                                      .subscriptionPlanBenefits[
                                                          index]
                                                      .title ??
                                                  '',
                                              color: Color(
                                                0xFFE7F5FF,
                                              ),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            CommonTextWidget(
                                              text: widget
                                                      .planDetails!
                                                      .subscriptionPlanBenefits[
                                                          index]
                                                      .subscriptionBenefitsDescription ??
                                                  '',
                                              color: Color(
                                                0xFFE7F5FF,
                                              ),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            )
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: 20,
                                    );
                                  },
                                  itemCount: widget.planDetails!
                                      .subscriptionPlanBenefits.length),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.transparent,
                          Color(0xFF381004),
                        ],
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 30, left: 20, right: 20),
                                    child: CommonButtonWidget(
                                        text: "Buy Now",
                                        onPressed: () {
                                          final args =
                                              BuySubscriptionPlanScreenArgument(
                                            planName:
                                                widget.planDetails?.planName ??
                                                    '',
                                            price: widget.planDetails?.price ??
                                                '0',
                                            moneyColor: widget
                                                    .planDetails?.moneyColor ??
                                                AppColor.kSecondaryButtonColor,
                                            belowBoxColor: widget.planDetails
                                                    ?.belowBoxColor ??
                                                AppColor.kSecondaryButtonColor,
                                            subscriptionYearlyPrice: widget.planDetails?.subscriptionYearlyPrice ?? '',
                                            isOffer: widget.planDetails?.isOffer ?? 0,
                                            offerDescription: widget.planDetails?.offerDescription ?? '',
                                            trialFor: widget.planDetails?.trialFor ?? 0,
                                                offerPerCentageOnMonth: widget.planDetails?.offerPerCentageOnMonth ?? '',
                                                offerPerCentageOnYear: widget.planDetails?.offerPerCentageOnYear ?? '',
                                            subscriptionId:widget.planDetails?.subscriptionId ?? ''
                                          );
                                          context.push(
                                              BuySubscriptionPlan.routeName,
                                              extra: args);
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
