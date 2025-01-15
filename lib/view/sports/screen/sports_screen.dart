import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/cubit/sport/get_sport_cubit.dart';
import 'package:zatayo/cubit/sport/get_sports_state.dart';
import 'package:zatayo/view/individual_sports_gym/screen/individual_sports.dart';
import 'package:zatayo/view/sports/widget/sports_banner_widget.dart';

import '../../../constant/app_color.dart';
import '../../common_widget/common_text_widget.dart';
import '../../feed_page/widget/header_widget.dart';
import '../widget/sports_by_id_widget.dart';

class SportsScreen extends StatefulWidget {
  const SportsScreen({super.key});

  @override
  State<SportsScreen> createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {
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
          Image.asset(
            "assets/images/offer_image.png",
            fit: BoxFit.cover,
            width: double.infinity,
          ),
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),


                SportsBannerWidget(),
                /******************** Top Fitness gym ********************/

                const SizedBox(
                  height: 30,
                ),
                SportsByIdWidget(),
                const SizedBox(
                  height: 20,
                ),


                /******************** Top Fitness gym ********************/

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
