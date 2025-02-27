import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/constant/app_color.dart';
import 'package:zatayo/view/common_widget/common_container_widget.dart';
import 'package:zatayo/view/common_widget/common_text_widget.dart';

import '../../../ApiClient/api_client.dart';
import '../../../cubit/customer_details/customer_details_cubit.dart';
import '../../../cubit/customer_details/customer_details_state.dart';
import '../widget/circular_progress_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                                                  )
                                                : Image.asset(
                                                    "assets/images/profile.png"))),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CommonTextWidget(text: "23"),
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
                        Container(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: CommonTextWidget(
                                                text: "Gold Subscription",
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 17,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: CommonTextWidget(
                                                text: "Diamond Sport's visited",
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: CommonTextWidget(
                                                text:
                                                    "Enjoy unlimited visits to Sliver Sport",
                                                color: Colors.black,
                                                overflow: TextOverflow.visible,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: CircularBorderWidget(
                                    progress: 0.5,
                                    completedText: "3/5",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
