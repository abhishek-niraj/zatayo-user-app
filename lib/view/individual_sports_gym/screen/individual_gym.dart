import 'package:flutter/material.dart';

import '../../../model/fitness/fitness_response_model.dart';
import '../../common_widget/common_app_bar_widget.dart';
import '../../common_widget/common_equipment.dart';
import '../../common_widget/common_item.dart';
import '../../common_widget/common_text_widget.dart';

class IndividualGym extends StatefulWidget {
  static const String routeName = "/individual-gym";
  final FitnessDataModel? fitnessDataModel;

  const IndividualGym({this.fitnessDataModel, super.key});

  @override
  State<IndividualGym> createState() => _IndividualGymState();
}

class _IndividualGymState extends State<IndividualGym> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonAppBarWidget(title: "Gym"),
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
                      image: widget.fitnessDataModel?.images?.first.image ?? '',
                      name: widget.fitnessDataModel?.name ?? '',
                      location: widget.fitnessDataModel?.locationName ?? '',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 22),
                      child: Column(
                        children: [
                          CommonTextWidget(
                              text: widget.fitnessDataModel?.description ?? ''),
                          SizedBox(
                            height: 38,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: widget.fitnessDataModel?.equipmentData
                                      ?.length ??
                                  0,
                              itemBuilder: (context, index) {

                              final data = widget.fitnessDataModel?.equipmentData![index];
                                return Column(
                                  children: [
                                    CommonEquipment(
                                      image: 'assets/images/fitness.png',
                                      title: data?.equipment ?? '',
                                      subtitle: data?.description ?? '',
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Divider(
                                      height: 1,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                );
                              })
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
