
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import '../../../constant/app_color.dart';
import '../../common_widget/common_text_widget.dart';
import '../../individual_sports_gym/screen/individual_gym.dart';
class FitnessScreen extends StatefulWidget {
  const FitnessScreen({super.key});

  @override
  State<FitnessScreen> createState() => _FitnessScreenState();
}

class _FitnessScreenState extends State<FitnessScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 44,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Morning ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF818898),
                          fontSize: 14,
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.28,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Hi, Abhishek Niraj !',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFD3D1D8),
                          fontSize: 18,
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: Color(0xFFDFE1E7)),
                        borderRadius: BorderRadius.circular(48),
                      ),
                    ),
                    child: Stack(
                      children: [
                        const Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Icon(
                            Icons.notifications_none_outlined,
                            size: 27,
                            color: Color(0xFFF5F5F5),
                          ),
                        ),
                        Positioned(
                          left: 25,
                          top: 15,
                          child: Container(
                            width: 6,
                            height: 6,
                            decoration: const ShapeDecoration(
                              color: Color(0xFFDF1C41),
                              shape: OvalBorder(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 11,
          ),
          Container(
            child: Image.asset(
              "assets/images/offer_image.png",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
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
              children: [
                const SizedBox(
                  height: 20,
                ),


                const SizedBox(
                  height: 20,
                ),
                /******************** Top Fitness gym ********************/
                InkWell(
                  onTap: (){
                    context.push(IndividualGym.routeName);
                  },
                  child: Column(
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
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonTextWidget(text: "Planet Fitness and Gym",
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                            Row(
                              children: [
                                Icon(Icons.star,
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
                            Icon(Icons.location_on_outlined,
                              size: 30,),
                            CommonTextWidget(text: "California, New York",
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
                InkWell(
                  onTap: (){
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
                              image: AssetImage(
                                  "assets/images/top_fitness_2.png"),
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonTextWidget(text: "Planet Fitness and Gym",
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                            Row(
                              children: [
                                Icon(Icons.star,
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
                            Icon(Icons.location_on_outlined,
                              size: 30,),
                            CommonTextWidget(text: "California, New York",
                              fontWeight: FontWeight.w400,
                            )
                          ],
                        ),
                      )

                    ],
                  ),
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
                              CommonTextWidget(text: "Vibe of the Month",
                              fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                              CommonTextWidget(text: "Sell All",
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
                            children:  [
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
                                      borderRadius:
                                      BorderRadius.circular(3),
                                    ),
                                  ),
                                  child:  const Stack(
                                    children: [
                                      Positioned(
                                          bottom: 45,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 10),
                                            child: CommonTextWidget(text: "Yoga",
                                            fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )),
                                      Positioned(
                                        bottom: 15,

                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 5),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.flare_sharp,
                                                  color: Color(0xFFC1C7D0),
                                                    size: 18,
                                                  ),
                                                  CommonTextWidget(text: "210kcl",
                                                  fontWeight: FontWeight.w600,
                                                    fontSize: 11,
                                                    color: Color(0xFFC1C7D0),
                                                  )
                                                ],
                                              ),
                                              SizedBox(width: 20,),
                                              Row(
                                                children: [
                                                  Icon(Icons.alarm_add_sharp,
                                                  size: 18,
                                                    color: Color(0xFFC1C7D0),
                                                  ),
                                                  CommonTextWidget(text: "210kcl",
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
                                      borderRadius:
                                      BorderRadius.circular(3),
                                    ),
                                  ),
                                  child:  const Stack(
                                    children: [
                                      Positioned(
                                          bottom: 45,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 10),
                                            child: CommonTextWidget(text: "Yoga",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )),
                                      Positioned(
                                        bottom: 15,

                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 5),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.flare_sharp,
                                                    color: Color(0xFFC1C7D0),
                                                    size: 18,
                                                  ),
                                                  CommonTextWidget(text: "210kcl",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 11,
                                                    color: Color(0xFFC1C7D0),
                                                  )
                                                ],
                                              ),
                                              SizedBox(width: 20,),
                                              Row(
                                                children: [
                                                  Icon(Icons.alarm_add_sharp,
                                                    size: 18,
                                                    color: Color(0xFFC1C7D0),
                                                  ),
                                                  CommonTextWidget(text: "210kcl",
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
                        const CommonTextWidget(text: "Reviews",
                        fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: CommonTextWidget(text: "This gym feels like home! The staff and members are"
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
