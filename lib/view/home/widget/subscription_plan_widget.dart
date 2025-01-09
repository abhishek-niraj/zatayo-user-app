import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/ApiClient/api_client.dart';
import 'package:zatayo/cubit/subscription_plan/subscription_plan_cubit.dart';
import 'package:zatayo/cubit/subscription_plan/subscription_plan_state.dart';

import '../../common_widget/cached_image_widget.dart';
import '../../common_widget/common_text_widget.dart';
import '../../subscriptionplan/subscription_plan.dart';

class SubscriptionPlanWidget extends StatefulWidget {
  const SubscriptionPlanWidget({super.key});

  @override
  State<SubscriptionPlanWidget> createState() => _SubscriptionPlanWidgetState();
}

class _SubscriptionPlanWidgetState extends State<SubscriptionPlanWidget> {
  @override
  void initState() {
    context.read<SubscriptionPlanCubit>().fetchSubscriptionPlan();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscriptionPlanCubit, SubscriptionPlanState>(
      builder: (BuildContext context, state) {
        if(state is SubscriptionPlanSuccess){
          final subscriptionPlan = state.subscriptionPlanResponseModel.data;
          return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CommonTextWidget(
                    text: "Explore Zatayo",
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    letterSpacing: -0.3,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 325,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: subscriptionPlan?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            context.push(SubscriptionPlan.routeName);
                          },
                          child: Container(
                            width: 200,
                            height: 307,
                            decoration: ShapeDecoration(
                              color: Colors.white.withOpacity(0.25),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 0.10, color: Colors.white),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x1E18274B),
                                  blurRadius: 6.41,
                                  offset: Offset(0, 2.85),
                                  spreadRadius: -2.14,
                                ),
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 1.42,
                                  offset: Offset(0, 1.42),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 13,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 13),
                                  child: Container(
                                    width: 200,
                                    height: 158,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                           '$baseUrl/${subscriptionPlan?[index].image}'
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  )

                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Column(
                                    children: [
                                       CommonTextWidget(
                                        text: subscriptionPlan?[index].name ?? '',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        letterSpacing: -0.3,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                       CommonTextWidget(
                                        text:
                                        subscriptionPlan?[index].description ?? '',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        width: 200,
                                        decoration: const ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              width: 0.70,
                                              strokeAlign: BorderSide
                                                  .strokeAlignCenter,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                       Row(
                                        children: [
                                          CommonTextWidget(
                                            text: "₹ ${subscriptionPlan?[index].price}/month ",
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                          ),
                                          SizedBox(
                                            width: 9,
                                          ),
                                          Expanded(
                                            child: CommonTextWidget(
                                              text: "Ownards",
                                              fontWeight: FontWeight.w300,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder:
                          (BuildContext context, int index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
