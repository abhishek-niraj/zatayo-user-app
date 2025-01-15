import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/cubit/subscription_plan/add_subscription_cubit.dart';
import 'package:zatayo/cubit/subscription_plan/buy_subscription_plan_cubit.dart';
import 'package:zatayo/cubit/subscription_plan/buy_subscription_plan_state.dart';
import 'package:zatayo/view/common_widget/common_app_bar_widget.dart';
import 'package:zatayo/view/common_widget/common_button_widget.dart';
import 'package:zatayo/view/common_widget/common_text_widget.dart';
import 'package:zatayo/view/subscriptionplan/screen_argumnet/buy_subscription_plan_screen_argument.dart';
import 'package:zatayo/view/subscriptionplan/widget/diamond_plan.dart';
import 'package:zatayo/view/subscriptionplan/widget/gold_plan.dart';
import 'package:zatayo/view/subscriptionplan/widget/sliver_plan.dart';
import 'package:zatayo/view/success_paymnet/screen/success_payment.dart';

import '../../common_widget/common_container_widget.dart';
import '../../common_widget/common_loading_indicator.dart';

class BuySubscriptionPlan extends StatefulWidget {
  static const String routeName = "/buy-subscription-plan";
  final BuySubscriptionPlanScreenArgument? planDetails;

  const BuySubscriptionPlan({this.planDetails, super.key});

  @override
  State<BuySubscriptionPlan> createState() => _BuySubscriptionPlanState();
}

class _BuySubscriptionPlanState extends State<BuySubscriptionPlan> {
  late bool _isMonthly = false;
  late bool _isYearly = true;

  void monthlySelection({required String inputPrice, required String planFor}) {
    context.read<AddSubscriptionCubit>().updateModel(
        subscriptionId: widget.planDetails?.subscriptionId ?? '',
        inputPrice: inputPrice,
        planFor: planFor);
    setState(() {
      _isMonthly = !_isMonthly;
      _isYearly = !_isYearly;
    });
  }

  @override
  void initState() {
    context.read<AddSubscriptionCubit>().updateModel(
        subscriptionId: widget.planDetails?.subscriptionId ?? '',
        inputPrice: widget.planDetails?.subscriptionYearlyPrice,
        planFor: 'year');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        subscriptionPlan: widget.planDetails!.planName,
                        price: widget.planDetails!.price,
                      ),
                    if (widget.planDetails?.planName != null &&
                        widget.planDetails!.planName.contains("Gold"))
                      GoldPlan(
                        subscriptionName: widget.planDetails!.planName,
                        price: widget.planDetails!.price,
                      ),
                    const SizedBox(
                      height: 45,
                    ),
                    CommonTextWidget(
                      text:
                          '${widget.planDetails?.offerPerCentageOnYear} % OFF',
                      fontSize: 44,
                      fontWeight: FontWeight.w900,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CommonTextWidget(
                      text: "${widget.planDetails?.offerDescription}",
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        monthlySelection(
                                            inputPrice:
                                                widget.planDetails?.price ?? '',
                                            planFor: 'month');
                                      },
                                      child: ContainerWidget(
                                        height: 102,
                                        borderRadius: 3,
                                        borderWidth: _isMonthly ? 3 : 1,
                                        borderColor: _isMonthly
                                            ? Colors.white
                                            : widget.planDetails!.belowBoxColor,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 20, top: 22),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CommonTextWidget(
                                                text: "MONTHLY",
                                                letterSpacing: 2,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 16,
                                              ),
                                              CommonTextWidget(
                                                text:
                                                    "₹${widget.planDetails?.price} /month",
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
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            monthlySelection(
                                                inputPrice: widget.planDetails!
                                                    .subscriptionYearlyPrice,
                                                planFor: 'year');
                                          },
                                          child: ContainerWidget(
                                            height: 102,
                                            borderRadius: 3,
                                            borderWidth: _isYearly ? 3 : 2,
                                            borderColor: _isYearly
                                                ? Colors.white
                                                : widget
                                                    .planDetails!.belowBoxColor,
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
                                                    text:
                                                        "₹${((double.parse(widget.planDetails!.subscriptionYearlyPrice)) / 12).toStringAsFixed(2)} /month",
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w800,
                                                    color: widget.planDetails
                                                            ?.moneyColor ??
                                                        Colors.transparent,
                                                  ),
                                                  if (widget.planDetails
                                                          ?.trialFor ==
                                                      0)
                                                    CommonTextWidget(
                                                      text: "No free trial",
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (widget.planDetails!.trialFor > 0)
                                          Positioned(
                                            top: -10,
                                            // Adjust as needed for overlap
                                            right: 23,
                                            child: ContainerWidget(
                                              borderRadius: 5,
                                              height: 30,
                                              width: 125,
                                              borderWidth: 0,
                                              borderColor: Colors.transparent,
                                              backgroundColor:
                                                  Color(0xFFFE724C),
                                              child: Center(
                                                  child: CommonTextWidget(
                                                text:
                                                    "${widget.planDetails!.trialFor}-day free trial",
                                                fontWeight: FontWeight.w800,
                                                fontSize: 16,
                                              )),
                                            ),
                                          ),
                                        Positioned(
                                          bottom: 0,
                                          // Adjust as needed for overlap
                                          right: 0,
                                          child: ContainerWidget(
                                            borderRadius: 5,
                                            height: 26,
                                            width: 44,
                                            borderWidth: 0,
                                            borderColor: Colors.transparent,
                                            backgroundColor: widget.planDetails
                                                    ?.belowBoxColor ??
                                                Colors.transparent,
                                            child: Center(
                                                child: CommonTextWidget(
                                              text:
                                                  "-${widget.planDetails!.offerPerCentageOnYear}%",
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
                            child: BlocConsumer<BuySubscriptionPlanCubit,
                                BuySubscriptionPlanState>(
                              builder: (BuildContext context, state) {

                                return CommonButtonWidget(
                                    text: " SUBSCRIBE",
                                    onPressed: () {
                                      final addSubscriptionCubit = context
                                          .read<AddSubscriptionCubit>()
                                          .state;
                                      final bodyRequest = {
                                        "subscriptionId":
                                        addSubscriptionCubit.subscriptionId,
                                        "inputPrice":
                                        addSubscriptionCubit.inputPrice,
                                        "planFor": addSubscriptionCubit.planFor
                                      };
                                      context
                                          .read<BuySubscriptionPlanCubit>()
                                          .buySubscriptionPlan(bodyRequest);
                                      // showCustomCupertinoDialog(
                                      //   context
                                      // );

                                    });
                              },
                              listener: (BuildContext context, state) {
                                if(state is BuySubscriptionPlanLoading){
                                  showCustomCupertinoDialog(context);
                                }else if(state is BuySubscriptionPlanSuccess){
                                  Navigator.pop(context);
                                  context.push(SuccessPayment.routeName);
                                }else if(state is BuySubscriptionPlanFail){
                                  Navigator.pop(context);
                                }

                                else{
                                  Navigator.pop(context);
                                }
                              },
                            ),
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
