import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/cubit/fitness/fitness_cubit.dart';
import 'package:zatayo/cubit/fitness_banner/fitness_banner_cubit.dart';

import '../../../ApiClient/api_client.dart';
import '../../../constant/app_color.dart';
import '../../common_widget/common_text_widget.dart';
import '../../feed_page/widget/header_widget.dart';
import '../../individual_sports_gym/screen/individual_gym.dart';
import '../widget/fitness_banner_widget.dart';
import '../widget/top_fitness_widget.dart';

class FitnessScreen extends StatefulWidget {
  const FitnessScreen({super.key});

  @override
  State<FitnessScreen> createState() => _FitnessScreenState();
}

class _FitnessScreenState extends State<FitnessScreen> {

  @override
  void initState() {
    context.read<FitnessCubit>().fetchFitness();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 44,
          ),
          HeaderWidget(),
          const SizedBox(
            height: 11,
          ),
          FitnessBannerWidget(),
          Container(
            width: double.infinity,
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
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonTextWidget(
                          text: "Top Fitness Center in your Area",
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                      CommonTextWidget(
                        text: "See All",
                        color: AppColor.kSecondaryButtonColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  ),
                ),

                TopFitnessWidget(),

                /******************** Top Fitness gym ********************/

                const SizedBox(
                  height: 20,
                ),


                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.transparent,
                        Color(0xFF381004),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonTextWidget(
                                text: "Vibe of the Month",
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                              CommonTextWidget(
                                text: "Sell All",
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: StaggeredGrid.count(
                            crossAxisCount: 4,
                            mainAxisSpacing: 1,
                            crossAxisSpacing: 10,
                            children: [
                              StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: 2,
                                child: Container(
                                  decoration: ShapeDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/group_4.png"),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                  child: const Stack(
                                    children: [
                                      Positioned(
                                          bottom: 45,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: CommonTextWidget(
                                              text: "Yoga",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )),
                                      Positioned(
                                        bottom: 15,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.flare_sharp,
                                                    color: Color(0xFFC1C7D0),
                                                    size: 18,
                                                  ),
                                                  CommonTextWidget(
                                                    text: "210kcl",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 11,
                                                    color: Color(0xFFC1C7D0),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.alarm_add_sharp,
                                                    size: 18,
                                                    color: Color(0xFFC1C7D0),
                                                  ),
                                                  CommonTextWidget(
                                                    text: "210kcl",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 11,
                                                    color: Color(0xFFC1C7D0),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: 2,
                                child: Container(
                                  decoration: ShapeDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/group_4.png"),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                  child: const Stack(
                                    children: [
                                      Positioned(
                                          bottom: 45,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: CommonTextWidget(
                                              text: "Yoga",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )),
                                      Positioned(
                                        bottom: 15,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.flare_sharp,
                                                    color: Color(0xFFC1C7D0),
                                                    size: 18,
                                                  ),
                                                  CommonTextWidget(
                                                    text: "210kcl",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 11,
                                                    color: Color(0xFFC1C7D0),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.alarm_add_sharp,
                                                    size: 18,
                                                    color: Color(0xFFC1C7D0),
                                                  ),
                                                  CommonTextWidget(
                                                    text: "210kcl",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 11,
                                                    color: Color(0xFFC1C7D0),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 57,
                        ),
                        const CommonTextWidget(
                          text: "Reviews",
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: CommonTextWidget(
                            text:
                                "This gym feels like home! The staff and members are"
                                " incredibly welcoming, creating a motivating "
                                "and supportive community.",
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
