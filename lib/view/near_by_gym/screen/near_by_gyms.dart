import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/app_router.dart';
import 'package:zatayo/view/common_widget/common_app_bar_widget.dart';
import 'package:zatayo/view/common_widget/common_text_widget.dart';

import '../../common_widget/common_item.dart';

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
        title: const CommonAppBarWidget(
          title: "Famous Gyms",
        ),
      ),
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
                child: ListView.separated(
              itemCount: 10,
              itemBuilder: (BuildContext context, index) {
                return InkWell(
                    onTap: (){
                      context.push("/individual-gym");
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
