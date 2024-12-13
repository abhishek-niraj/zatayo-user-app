import 'package:flutter/material.dart';

import '../../common_widget/common_app_bar_widget.dart';
import '../../common_widget/common_equipment.dart';
import '../../common_widget/common_item.dart';
import '../../common_widget/common_text_widget.dart';
class IndividualGym extends StatefulWidget {
  const IndividualGym({super.key});

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
                    CommonItem(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 22),
                      child: Column(
                        children: [
                          CommonTextWidget(
                              text: "Planet  Gym provides a fully equipped fitness center with advanced machines, free weights, and functional training zones. Our gym caters to all fitness levels, offering personalized training programs, group workouts, and professional guidance. It’s the perfect space "
                                  "to achieve your health goals "
                                  "in a supportive and motivating"
                                  " environment."),
                          SizedBox(
                            height: 38,
                          ),
                          CommonEquipment(
                            image: 'assets/images/fitness.png',
                            title: 'Equipment',
                            subtitle: 'All type of Equipments',
                          ),
                          SizedBox(height: 8,),
                          Divider(
                            height: 1,
                          ),
                          SizedBox(height: 20,),
                          CommonEquipment(
                            image: 'assets/images/gym.png',
                            title: 'Group workouts',
                            subtitle: 'functional Training, Circuit training, Core Strength',
                          ),
                          SizedBox(height: 8,),
                          Divider(
                            height: 1,
                          ),
                          SizedBox(height: 20,),
                          CommonEquipment(
                            image: 'assets/images/changing-room.png',
                            title: 'Changing romms',
                            subtitle: 'Santization & Hygienic',
                          ),
                          SizedBox(height: 8,),
                          Divider(
                            height: 1,
                          ),
                          SizedBox(height: 20,),
                          CommonEquipment(
                            image: 'assets/images/lockers.png',
                            title: 'Lockers',
                            subtitle: 'Secure Locking Mechanism',
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
