import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/app_router.dart';
import 'package:zatayo/cubit/subscription_benefits/subscription_benefits_cubit.dart';
import 'package:zatayo/cubit/subscription_benefits/subscription_benefits_state.dart';
import 'package:zatayo/cubit/subscription_plan/subscription_plan_cubit.dart';
import 'package:zatayo/cubit/subscription_plan/subscription_plan_state.dart';
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
  void initState() {
    context.read<SubscriptionBenefitsCubit>().getSubscriptionBenefits();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonAppBarWidget(title: "Subscription Plans"),
      ),
      body: SafeArea(
        child: BlocBuilder<SubscriptionPlanCubit, SubscriptionPlanState>(
          builder: (BuildContext context, state) {
            if (state is SubscriptionPlanSuccess) {
              return Column(
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
                      child: BlocBuilder<SubscriptionBenefitsCubit,
                          SubscriptionBenefitsState>(
                        builder: (BuildContext context, state) {
                          if (state is SubscriptionBenefitsSuccess) {
                            final subscriptionBenefits = state
                                .subscriptionPlanBenefitsResponseModel.data;
                            return ListView.separated(
                              itemCount: subscriptionBenefits?.length ?? 0,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      final args = SubscriptionPlanDetailsScreenArgument(
                                          planName: subscriptionBenefits![index]
                                                  .subscriptionName ??
                                              '',
                                          price:
                                              subscriptionBenefits[index]
                                                      .subscriptionPrice ??
                                                  '',
                                          titleNameOne:
                                              "All  GOLD  and  DIAMOND  gyms  &  sports",
                                          titleNameTwo:
                                              "At  DIAMOND  gyms  &  GOLD  gyms  and  sports",
                                          titleNameThree: "ALL  LIVE  classes",
                                          moneyColor: Color(0xFF627BFC),
                                          belowBoxColor: Color(0xFF9A9996),
                                          subscriptionPlanBenefits:
                                              subscriptionBenefits[index]
                                                      .subscriptionPlanBenefits ??
                                                  [],
                                          subscriptionYearlyPrice:
                                              subscriptionBenefits[index]
                                                  .subscriptionYearlyPrice,
                                          isOffer:
                                              subscriptionBenefits[index]
                                                  .isOffer,
                                          offerDescription: subscriptionBenefits[index]
                                              .offerDescription,
                                          trialFor:
                                              subscriptionBenefits[index]
                                                  .trialFor,
                                          offerPerCentageOnMonth:
                                              subscriptionBenefits[index]
                                                  .offerPerCentageOnMonth,
                                          offerPerCentageOnYear:
                                              subscriptionBenefits[index]
                                                  .offerPerCentageOnYear,
                                          subscriptionId: subscriptionBenefits[index]
                                              .subscriptionId
                                      );
                                      context.push(
                                          SubscriptionPlanDetails.routeName,
                                          extra: args);
                                    },
                                    child: Column(
                                      children: [
                                        if (subscriptionBenefits?[index]
                                                    .subscriptionName !=
                                                null &&
                                            subscriptionBenefits![index]
                                                .subscriptionName!
                                                .contains("Gold"))
                                          GoldPlan(
                                            price: subscriptionBenefits[index]
                                                    .subscriptionPrice ??
                                                '0.0',
                                            subscriptionName:
                                                subscriptionBenefits[index]
                                                        .subscriptionName ??
                                                    '',
                                          ),
                                        if (subscriptionBenefits?[index]
                                                    .subscriptionName !=
                                                null &&
                                            subscriptionBenefits![index]
                                                .subscriptionName!
                                                .contains("Diamond"))
                                          DiamondPlan(
                                            subscriptionPlan:
                                                subscriptionBenefits[index]
                                                        .subscriptionName ??
                                                    '',
                                            price: subscriptionBenefits[index]
                                                    .subscriptionPrice ??
                                                '',
                                          ),
                                        if (subscriptionBenefits?[index]
                                                    .subscriptionName !=
                                                null &&
                                            subscriptionBenefits![index]
                                                .subscriptionName!
                                                .contains("Sliver"))
                                          SliverPlan(
                                            subscriptionPlanName:
                                                subscriptionBenefits[index]
                                                        .subscriptionName ??
                                                    '',
                                            price: subscriptionBenefits[index]
                                                    .subscriptionPrice ??
                                                '',
                                          ),
                                      ],
                                    ));
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox();
                              },
                            );
                          }
                          return SizedBox();
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}

//
// class TestAppY extends StatefulWidget {
//   const TestAppY({super.key});
//
//   @override
//   State<TestAppY> createState() => _TestAppYState();
// }
//
// class _TestAppYState extends State<TestAppY> {
//   @override
//   Widget build(BuildContext context) {
//     return  Column(
//       children: [
//         InkWell(
//             onTap: () {
//               final args = SubscriptionPlanDetailsScreenArgument(
//                   planName: "Sliver  Subscription",
//                   titleNameOne:
//                   "All  GOLD  and  DIAMOND  gyms  &  sports",
//                   titleNameTwo:
//                   "At  DIAMOND  gyms  &  GOLD  gyms  and  sports",
//                   titleNameThree: "ALL  LIVE  classes",
//                   moneyColor: Color(0xFF627BFC),
//                   belowBoxColor: Color(0xFF9A9996));
//               context.push(
//                   SubscriptionPlanDetails.routeName,
//                   extra: args);
//             },
//             child: const SliverPlan()),
//         InkWell(
//             onTap: () {
//               final args =
//                   SubscriptionPlanDetailsScreenArgument(
//                       planName: "Gold  Subscription",
//                       titleNameOne:
//                           "All  GOLD  and  SLIVER  gyms  &  sports",
//                       titleNameTwo:
//                           "At DIAMOND gyms & sports",
//                       titleNameThree: "ALL LIVE classes",
//                       moneyColor: Color(0xFFFE724C),
//                       belowBoxColor: Color(0xFFFFCB32));
//               context.push(
//                   SubscriptionPlanDetails.routeName,
//                   extra: args);
//             },
//             child: GoldPlan()),
//         InkWell(
//             onTap: () {
//               final args = SubscriptionPlanDetailsScreenArgument(
//                   planName: "Diamond  Subscription",
//                   titleNameOne:
//                       "All  Sliver  and  Gold  gyms  &  sports",
//                   titleNameTwo:
//                       "At  Gold  Gyms  &  PLATINUM  gyms  and  sports",
//                   titleNameThree: "ALL  LIVE  classes",
//                   moneyColor: Color(0xFF627BFC),
//                   belowBoxColor: Color(0xFF78BAF4));
//               context.push(
//                   SubscriptionPlanDetails.routeName,
//                   extra: args);
//             },
//             child: DiamondPlan())
//       ],
//     );
//   }
// }
