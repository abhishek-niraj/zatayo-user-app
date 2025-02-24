import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/app_router.dart';
import 'package:zatayo/cubit/customer_details/user_selected_location_information_cubit.dart';
import 'package:zatayo/view/common_widget/common_app_bar_widget.dart';
import 'package:zatayo/view/common_widget/common_text_widget.dart';

import '../../common_widget/common_item.dart';
import '../../fitness/widget/top_fitness_widget.dart';

class NearByGyms extends StatefulWidget {
  const NearByGyms({super.key});

  @override
  State<NearByGyms> createState() => _NearByGymsState();
}

class _NearByGymsState extends State<NearByGyms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_outlined)),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on),
                        CommonTextWidget(
                          text: "Near By Sports",
                          fontSize: 18,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Builder(builder: (context) {
                          final userSelectedLocationCubit = context
                              .watch<UserSelectedLocationInformationCubit>()
                              .state;
                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CommonTextWidget(
                                  text:
                                      '${userSelectedLocationCubit.cityName}'),
                            ),
                          );
                        }),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
          )),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF111214),
              Color(0xFF501604),
            ],
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CommonTextWidget(
                    text: "Top Fitness Centers in Your Area",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(child: TopFitnessWidget()),
            )
          ],
        ),
      ),
    );
  }
}
