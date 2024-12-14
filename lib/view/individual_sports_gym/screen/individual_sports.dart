import 'package:flutter/material.dart';
import 'package:zatayo/view/common_widget/common_app_bar_widget.dart';
import 'package:zatayo/view/common_widget/common_item.dart';
import 'package:zatayo/view/common_widget/common_text_widget.dart';

import '../../common_widget/common_equipment.dart';

class IndividualSports extends StatefulWidget {
  static const String routeName = "/individual-sports";
  const IndividualSports({super.key});

  @override
  State<IndividualSports> createState() => _IndividualSportsState();
}

class _IndividualSportsState extends State<IndividualSports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonAppBarWidget(title: "Sports"),
      ),
      body: Column(
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CommonItem(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 22),
                      child: Column(
                        children: [
                          CommonTextWidget(
                              text: "Planet Sports Club "
                                  "offers top-notch facilities for boxing, swimming,"
                                  " badminton, and football. With a professional boxing arena,"
                                  " a modern swimming pool, high-quality badminton courts,"
                                  " and a well-maintained football ground, we provide "
                                  "the perfect space for sports enthusiasts to train,"
                                  " play, and enjoy an active, healthy lifestyle."),
                          SizedBox(
                            height: 38,
                          ),
                          CommonEquipment(
                            image: 'assets/images/swimming.png',
                            title: 'Swimming',
                            subtitle: 'In-ground, Above-ground,Vinyl-lined',
                          ),
                          SizedBox(height: 8,),
                          Divider(
                            height: 1,
                          ),
                          SizedBox(height: 20,),
                          CommonEquipment(
                            image: 'assets/images/badminton.png',
                            title: 'Badminton',
                            subtitle: 'Wooden courts',
                          ),
                          SizedBox(height: 8,),
                          Divider(
                            height: 1,
                          ),
                          SizedBox(height: 20,),
                          CommonEquipment(
                            image: 'assets/images/boxing-gloves.png',
                            title: 'Boxing',
                            subtitle: 'Kickboxing, Mixed Martial Arts (MMA)',
                          ),
                          SizedBox(height: 8,),
                          Divider(
                            height: 1,
                          ),
                          SizedBox(height: 20,),
                          CommonEquipment(
                            image: 'assets/images/football.png',
                            title: 'Football',
                            subtitle: 'Firm Ground',
                          ),
                          SizedBox(height: 8,),
                          Divider(
                            height: 1,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
