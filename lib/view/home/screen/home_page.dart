// Example Pages
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/cubit/home_page_banner/home_page_banner_state.dart';
import 'package:zatayo/view/common_widget/common_container_widget.dart';
import 'package:zatayo/view/home/widget/deal_of_day_widget.dart';
import 'package:zatayo/view/pick_an_area/screen/pick_an_area_screen.dart';
import 'package:zatayo/view/play_sports/screen/play_sports_screen.dart';

import '../../../ApiClient/api_client.dart';
import '../../../constant/app_color.dart';
import '../../../cubit/home_page_banner/home_page_banner_cubit.dart';
import '../../../cubit/sport/get_sport_cubit.dart';
import '../../common_widget/common_text_widget.dart';
import '../../feed_page/widget/header_widget.dart';
import '../../home_work_out/screen/home_work_out.dart';
import '../../individual_sports_gym/screen/individual_sports.dart';
import 'package:zatayo/view/individual_sports_gym/screen/individual_gym.dart';
import 'package:zatayo/view/notification/screen/notification_screen.dart';
import 'package:zatayo/view/sports_places/screen/sports_places.dart';
import 'package:zatayo/view/subscriptionplan/subscription_plan.dart';

import '../widget/home_page_banner_widget.dart';
import '../widget/subscription_plan_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          HomePageBannerWidget(),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // alignment: WrapAlignment.spaceBetween,
                    // spacing: 20, // Horizontal space between items
                    // runSpacing: 20, // Vertical space between rows
                    children: [
                      // Near by gyms
                      InkWell(
                        onTap: () {
                          context.push("/near-by-gyms");
                          // context.push(PickAnAreaScreen.routeName);
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/near_by_gym.png",
                              width: 60, // Adjust size as needed
                              height: 60,
                            ),
                            const SizedBox(height: 8),
                            const CommonTextWidget(text: "Near by gyms"),
                          ],
                        ),
                      ),
                      // Play Sports
                      InkWell(
                        onTap: () {
                          context.push(PlaySportsScreen.routeName);
                          // context.push("/sport-places");
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/play_sports.png",
                              width: 60,
                              height: 60,
                            ),
                            const SizedBox(height: 8),
                            const CommonTextWidget(text: "Play Sports"),
                          ],
                        ),
                      ),
                      // Home workout
                      InkWell(
                        onTap: () {
                          context.push(HomeWorkOut.routeName);
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/home_wor_out.png",
                              width: 60,
                              height: 60,
                            ),
                            const SizedBox(height: 8),
                            const CommonTextWidget(text: "Home workout"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Deal of the day",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                DealOfDayWidget(),
                const SizedBox(
                  height: 20,
                ),
                SubscriptionPlanWidget(),
                SizedBox(height: 20,),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            "Explore the Sports ",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Builder(
                      builder: (context) {
                        final sportsData = context.watch<GetSportCubit>();
                        if(sportsData.getSportsResponseModel.data != null){
                          return Padding(
                            padding: const EdgeInsets.only(left: 8, right: 20),
                            child: SizedBox(
                              height: 450,
                              width: double.infinity,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.zero,
                                itemCount: sportsData.getSportsResponseModel.data?.length ?? 0,
                                itemBuilder: ((context, index) {
                                  final sport = sportsData.getSportsResponseModel.data?[index];
                                  return InkWell(
                                    onTap: () {
                                      context.push(SportsPlaces.routeName);
                                    },
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(left: 10),
                                              child: Container(
                                                width: 334.48,
                                                height: 450,
                                                decoration: ShapeDecoration(
                                                  color:
                                                  Colors.white.withOpacity(0.25),
                                                  shape: RoundedRectangleBorder(
                                                    side: const BorderSide(
                                                        width: 0.10,
                                                        color: Colors.white),
                                                    borderRadius:
                                                    BorderRadius.circular(7.80),
                                                  ),
                                                  shadows: const [
                                                    BoxShadow(
                                                      color: Color(0x1E18274B),
                                                      blurRadius: 6.25,
                                                      offset: Offset(0, 2.78),
                                                      spreadRadius: -2.08,
                                                    ),
                                                    BoxShadow(
                                                      color: Color(0x3F000000),
                                                      blurRadius: 1.39,
                                                      offset: Offset(0, 1.39),
                                                      spreadRadius: 0,
                                                    ),
                                                  ],
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(7.80),
                                                  child: CachedNetworkImage(
                                                    filterQuality: FilterQuality.low,
                                                    fit: BoxFit.cover,
                                                    imageUrl:
                                                    "$baseUrl/${sport?.image ?? ''}",
                                                    placeholder: (context, url) =>
                                                    const Center(
                                                        child:
                                                        CircularProgressIndicator()),
                                                    errorWidget: (context, url,
                                                        error) =>
                                                    const Center(
                                                        child: Icon(Icons.error)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 0,
                                              right: 0,
                                              top: 300,
                                              child: Column(
                                                children: [
                                                   Center(
                                                    child: CommonTextWidget(
                                                      text: "${sport?.name?.toUpperCase()}",
                                                      fontSize: 30,
                                                    ),
                                                  ),
                                                  const CommonTextWidget(
                                                    text: "Playing",
                                                    fontSize: 20,
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 15, sigmaY: 15),
                                                      child: Container(
                                                        width: 100,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                            color: Colors.grey
                                                                .withOpacity(0),
                                                            borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    10))),
                                                        child: const Center(
                                                            child: CommonTextWidget(
                                                              text: "Explore",
                                                              fontSize: 20,
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              ),
                            ),
                          );
                        }
                        return SizedBox();
                      }
                    ),
                  ],
                ),
                //*************************************/

                const SizedBox(
                  height: 20,
                ),
                /******************** Top Fitness gym ********************/
                Column(
                  children: [
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
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        context.push(IndividualSports.routeName);
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              width: double.infinity,
                              height: 180,
                              decoration: ShapeDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/top_fitness_1.png"),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonTextWidget(
                                  text: "Planet Fitness and Gym",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    CommonTextWidget(text: '4.5')
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 30,
                                ),
                                CommonTextWidget(
                                  text: "California, New York",
                                  fontWeight: FontWeight.w400,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                /******************** Top Fitness gym ********************/

                InkWell(
                  onTap: () {
                    context.push(IndividualGym.routeName);
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          width: double.infinity,
                          height: 180,
                          decoration: ShapeDecoration(
                            image: const DecorationImage(
                              image:
                                  AssetImage("assets/images/top_fitness_2.png"),
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonTextWidget(
                              text: "Planet Fitness and Gym",
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                CommonTextWidget(text: '4.5')
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 30,
                            ),
                            CommonTextWidget(
                              text: "California, New York",
                              fontWeight: FontWeight.w400,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 334.48,
                  height: 365,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.25),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 0.10, color: Colors.white),
                      borderRadius: BorderRadius.circular(7.80),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x1E18274B),
                        blurRadius: 6.25,
                        offset: Offset(0, 2.78),
                        spreadRadius: -2.08,
                      ),
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 1.39,
                        offset: Offset(0, 1.39),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      const CommonTextWidget(text: "Transform"),
                      Image.asset('assets/images/loss_weight.png'),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonTextWidget(text: 'Before '),
                          SizedBox(
                            width: 60,
                          ),
                          CommonTextWidget(text: 'After ')
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: CommonTextWidget(
                                  text: 'Transform yourself today for'
                                      ' just ₹ 699 – see the difference tomorrow!',
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
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
                        const CommonTextWidget(
                          text: "Unleash",
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                        const CommonTextWidget(
                          text: "Your fitness",
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                        const CommonTextWidget(
                          text: "Journey today",
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: StaggeredGrid.count(
                            crossAxisCount: 4,
                            mainAxisSpacing: 10,
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
                                ),
                              ),
                              StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: 3,
                                child: Container(
                                  decoration: ShapeDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/group_3.png"),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                ),
                              ),
                              StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: 2,
                                child: Container(
                                  decoration: ShapeDecoration(
                                    image: const DecorationImage(
                                      image:
                                          AssetImage("assets/images/plan.png"),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                ),
                              ),
                              StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: 2,
                                child: Container(
                                  decoration: ShapeDecoration(
                                    image: const DecorationImage(
                                      image:
                                          AssetImage("assets/images/group.png"),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    ),
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
                                          "assets/images/group_1.png"),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
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
        ],
      ),
    );
  }
}

