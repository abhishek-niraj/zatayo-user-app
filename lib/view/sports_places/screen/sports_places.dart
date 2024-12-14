import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common_widget/common_app_bar_widget.dart';
import '../../common_widget/common_item.dart';
import '../../common_widget/common_text_widget.dart';
class SportsPlaces extends StatefulWidget {
  static const String routeName = "/sport-places";
  const SportsPlaces({super.key});

  @override
  State<SportsPlaces> createState() => _SportsPlacesState();
}

class _SportsPlacesState extends State<SportsPlaces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonAppBarWidget(
          title: "Top Sport Places",
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
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
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CommonTextWidget(
                    text: "Top Sports Centers in Your Area",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                        onTap: (){
                          context.push("/individual-sports");
                        },
                        child: const CommonItem());
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 16,
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
