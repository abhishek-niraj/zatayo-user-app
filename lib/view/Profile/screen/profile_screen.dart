import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/constant/app_color.dart';
import 'package:zatayo/cubit/customer_details/customer_sport_visited_api_cubit.dart';
import 'package:zatayo/cubit/customer_details/customer_sport_visited_api_state.dart';
import 'package:zatayo/cubit/customer_details/get_my_plan_information_cubit.dart';
import 'package:zatayo/utils/get_current_month_dates.dart';
import 'package:zatayo/view/Profile/widget/service_activate_widget.dart';
import 'package:zatayo/view/common_widget/common_container_widget.dart';
import 'package:zatayo/view/common_widget/common_text_widget.dart';

import '../../../ApiClient/api_client.dart';
import '../../../cubit/customer_details/customer_basic_information_cubit.dart';
import '../../../cubit/customer_details/customer_details_cubit.dart';
import '../../../cubit/customer_details/customer_details_state.dart';
import '../../../cubit/subscription_plan/subscription_plan_activation_cubit.dart';
import '../../../cubit/subscription_plan/subscription_plan_activation_state.dart';
import '../../common_widget/linear_progress_bar_widegt.dart';
import '../widget/circular_progress_widget.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profile-screen';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    final getCurrentMonthDate = getCurrentMonthDates();
    final customerBasicInformation =
        context.read<CustomerBasicInformationCubit>().state;
    final bodyRequest = {
      "startDate": getCurrentMonthDate["startDate"],
      "endDate": getCurrentMonthDate["endDate"],
      "customerId": customerBasicInformation.customerId
    };
    context
        .read<CustomerSportVisitedBloc>()
        .fetchCustomerSportVisited(bodyRequest);
    context.read<GetMyPlanInformationCubit>().fetchMyPlan();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF111214),
                      Color(0xFF6D1F06),
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Row(
                          children: [
                           InkWell(
                             onTap: (){
                               Navigator.pop(context);
                             },
                             child: Row(
                               children: [
                                 SizedBox(width: 10,),
                                 Icon(
                                     Icons.arrow_back_outlined
                                 ),
                               ],
                             ),
                           ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: CommonTextWidget(
                                text: 'Profile',
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BlocBuilder<CustomerDetailsCubit, CustomerDetailsState>(
                          builder: (BuildContext context, state) {
                            if (state is GetCustomerDetailSuccess) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: ContainerWidget(
                                        borderRadius: 100,
                                        height: 98,
                                        width: 98,
                                        backgroundColor: Colors.transparent,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(56),
                                            child: state
                                                    .customerDetailsResponseModel
                                                    .data!
                                                    .first
                                                    .profileImage!
                                                    .isNotEmpty
                                                ? Image.network(
                                                    "$baseUrl/${state.customerDetailsResponseModel.data!.first.profileImage ?? ''}",
                                                    fit: BoxFit.cover,
                                                  )
                                                : Image.asset(
                                                    "assets/images/profile.png"))),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        BlocBuilder<CustomerSportVisitedBloc,
                                            GetCustomerSportVisitedState>(
                                          builder:
                                              (BuildContext context, state) {
                                            if (state
                                                is GetCustomerSportVisitedStateSuccess) {
                                              return CommonTextWidget(
                                                  text: state
                                                      .resourceDataResponseModel
                                                      .data!
                                                      .first
                                                      .resourceData
                                                      .toString());
                                            }
                                            return CommonTextWidget(text: "0");
                                          },
                                        ),
                                        CommonTextWidget(
                                          text: 'Sports visited',
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        CommonTextWidget(text: "23"),
                                        CommonTextWidget(
                                          text: 'Friends',
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        CommonTextWidget(text: "23"),
                                        CommonTextWidget(
                                          text: 'Reviews',
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }
                            return SizedBox();
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BlocBuilder<CustomerDetailsCubit,
                                CustomerDetailsState>(
                              builder: (BuildContext context, state) {
                                if (state is GetCustomerDetailSuccess) {
                                  return CommonTextWidget(
                                    text:
                                        '${state.customerDetailsResponseModel.data?.first.name}',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 21,
                                  );
                                }
                                return SizedBox();
                              },
                            ),
                            InkWell(
                              onTap: () {
                                context.push("/edit-profile");
                              },
                              child: const CommonTextWidget(
                                text: "Edit Profile",
                                color: AppColor.kPrimaryButtonColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        BlocListener<SubscriptionPlanActivationCubit, SubscriptionPlanActivationState>(listener: (BuildContext context,  state) {
                          if(state is SuccessActivationPlan){
                            context.pop();
                          }
                        },
                        child:  Builder(
                            builder: (context) {
                              final myPlanCubit = context.watch<GetMyPlanInformationCubit>().getMyPlanInformationResponseModel;
                              if(myPlanCubit.data != null && myPlanCubit.data!.isNotEmpty){
                                return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: myPlanCubit.data?.length ?? 0,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context, index) {
                                      final myPlanData = myPlanCubit.data?[index];
                                      return Padding(
                                        padding: const EdgeInsets.only(bottom: 10),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.topRight,
                                              colors: [
                                                Color(0xFFFDEA88),
                                                Color(0xFFFFCB32),
                                              ],
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 20,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: CommonTextWidget(
                                                                text: "Membership",
                                                                color: Color(0xFF444444),
                                                                fontWeight: FontWeight.w600,
                                                                overflow:
                                                                TextOverflow.ellipsis,
                                                              ),
                                                            ),
                                                            if(myPlanData?.subscriptionStatus == "Pause")
                                                              ServiceActivateWidget(
                                                                id: myPlanData?.id ?? 0,
                                                              ),
                                                            if(myPlanData?.subscriptionStatus == "Active")
                                                              Padding(
                                                                padding: const EdgeInsets.only(right: 10),
                                                                child: CommonTextWidget(
                                                                  text: "Expires in : ${myPlanData?.totalRemainingDays ?? ''}",
                                                                  color: Color(0xFF444444),
                                                                  fontWeight: FontWeight.w600,
                                                                  overflow:
                                                                  TextOverflow.ellipsis,
                                                                ),
                                                              )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: CommonTextWidget(
                                                                text: myPlanData?.planName ?? '',
                                                                fontSize: 18,
                                                                fontWeight: FontWeight.w700,
                                                                color: Colors.black,
                                                                overflow:
                                                                TextOverflow.ellipsis,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.only(right: 10),
                                                              child: CommonTextWidget(
                                                                text: myPlanData?.subscriptionStatus ?? '',
                                                                fontSize: 18,
                                                                fontWeight: FontWeight.w700,
                                                                color: Colors.black,
                                                                overflow:
                                                                TextOverflow.ellipsis,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 17,
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(right: 10),
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                child: CommonTextWidget(
                                                                  text:
                                                                  "Diamond Sport's visited ",
                                                                  fontWeight: FontWeight.w700,
                                                                  color: Colors.black,
                                                                  overflow:
                                                                  TextOverflow.ellipsis,
                                                                ),
                                                              ),
                                                              if(myPlanData?.diamondDays == "Unlimited")
                                                                CommonTextWidget(
                                                                  text:
                                                                  "Unlimited",
                                                                  fontWeight: FontWeight.w700,
                                                                  color: Colors.black,
                                                                  overflow:
                                                                  TextOverflow.ellipsis,
                                                                )else
                                                                CommonTextWidget(
                                                                  text:
                                                                  "${myPlanData?.remainingDiamondDays}/${myPlanData?.diamondDays}",
                                                                  fontWeight: FontWeight.w700,
                                                                  color: Colors.black,
                                                                  overflow:
                                                                  TextOverflow.ellipsis,
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                        if(myPlanData?.diamondDays != "Unlimited" || myPlanData?.remainingDiamondDays != "Unlimited")
                                                          Padding(
                                                            padding: EdgeInsets.only(right: 10),
                                                            child: LinearProgressBarWidget(
                                                              progress: (double.parse(myPlanData?.remainingDiamondDays ?? "0.0") /
                                                                  double.parse(myPlanData?.diamondDays ?? "0.0")).clamp(0.0, 1.0),
                                                              completedText: "",
                                                            ),
                                                          )
                                                        else
                                                          Padding(
                                                            padding: EdgeInsets.only(right: 10),
                                                            child: LinearProgressBarWidget(
                                                              progress: 1,
                                                              completedText: "",
                                                            ),
                                                          ),

                                                        Padding(
                                                          padding: const EdgeInsets.only(right: 10),
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                child: CommonTextWidget(
                                                                  text:
                                                                  "Gold Sport's visited",
                                                                  fontWeight: FontWeight.w700,
                                                                  color: Colors.black,
                                                                  overflow:
                                                                  TextOverflow.ellipsis,
                                                                ),
                                                              ),
                                                              if(myPlanData?.goldDays == "Unlimited")
                                                                CommonTextWidget(
                                                                  text:
                                                                  "Unlimited",
                                                                  fontWeight: FontWeight.w700,
                                                                  color: Colors.black,
                                                                  overflow:
                                                                  TextOverflow.ellipsis,
                                                                )else
                                                                CommonTextWidget(
                                                                  text:
                                                                  "${myPlanData?.remainingGoldDays}/${myPlanData?.goldDays}",
                                                                  fontWeight: FontWeight.w700,
                                                                  color: Colors.black,
                                                                  overflow:
                                                                  TextOverflow.ellipsis,
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                        if(myPlanData?.goldDays == "Unlimited")
                                                          Padding(
                                                            padding: const EdgeInsets.only(right: 10),
                                                            child: LinearProgressBarWidget(
                                                              progress: 1,
                                                              completedText: "",
                                                            ),
                                                          ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(right: 10),
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                child: CommonTextWidget(
                                                                  text:
                                                                  "Sliver Sport's visited",
                                                                  fontWeight: FontWeight.w700,
                                                                  color: Colors.black,
                                                                  overflow:
                                                                  TextOverflow.ellipsis,
                                                                ),
                                                              ),
                                                              if(myPlanData?.sliverDays == "Unlimited")
                                                                CommonTextWidget(
                                                                  text:
                                                                  "Unlimited",
                                                                  fontWeight: FontWeight.w700,
                                                                  color: Colors.black,
                                                                  overflow:
                                                                  TextOverflow.ellipsis,
                                                                )else
                                                                CommonTextWidget(
                                                                  text:
                                                                  "${myPlanData?.sliverDays}/${myPlanData?.sliverDays}",
                                                                  fontWeight: FontWeight.w700,
                                                                  color: Colors.black,
                                                                  overflow:
                                                                  TextOverflow.ellipsis,
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                        if(myPlanData?.sliverDays == "Unlimited")
                                                          Padding(
                                                            padding: const EdgeInsets.only(right: 10),
                                                            child: LinearProgressBarWidget(
                                                              progress: 1,
                                                              completedText: "",
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                // Padding(
                                                //   padding: const EdgeInsets.only(right: 10),
                                                //   child: CircularBorderWidget(
                                                //     progress: 0.5,
                                                //     completedText: "3/5",
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              }
                              return SizedBox();
                            }
                        ),
                        )
                      ],
                    ),
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
