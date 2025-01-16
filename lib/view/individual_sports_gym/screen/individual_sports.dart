import 'package:flutter/material.dart';
import 'package:zatayo/view/common_widget/common_app_bar_widget.dart';
import 'package:zatayo/view/common_widget/common_item.dart';
import 'package:zatayo/view/common_widget/common_text_widget.dart';

import '../../../model/sport/get_sports_response_model_by_sport_id.dart';
import '../../common_widget/common_equipment.dart';

class IndividualSports extends StatefulWidget {
  static const String routeName = "/individual-sports";
  final SportsDataList? sportsDataList;

  const IndividualSports({this.sportsDataList, super.key});

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
                    CommonItem(
                      location: widget.sportsDataList?.locationName ?? '',
                      name: widget.sportsDataList?.sportName ?? '',
                      image: widget.sportsDataList?.images?[0].image ?? '',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 22),
                      child: Column(
                        children: [
                          CommonTextWidget(
                              text: widget.sportsDataList?.description ?? ''),
                          SizedBox(
                            height: 38,
                          ),
                          ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                widget.sportsDataList?.equipmentData?.length ??
                                    0,
                            itemBuilder: (context, index) {
                              final equipmentData = widget.sportsDataList?.equipmentData![index];
                              return Column(
                                children: [
                                  CommonEquipment(
                                    image: 'assets/images/swimming.png',
                                    title: equipmentData?.equipment ?? '',
                                    subtitle:
                                    equipmentData?.description ?? '',
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Divider(
                                    height: 1,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 8,
                              );
                            },
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
