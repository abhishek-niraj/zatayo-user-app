import 'package:flutter/material.dart';

import '../../common_widget/common_text_widget.dart';

class DiamondPlan extends StatefulWidget {
  const DiamondPlan({super.key});

  @override
  State<DiamondPlan> createState() => _DiamondPlanState();
}

class _DiamondPlanState extends State<DiamondPlan> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Container(
        width: media.width,
        height: 180,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Color(0xFFAFCEF6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.28),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x75000000),
              blurRadius: 9.82,
              offset: Offset(0, 1.31),
              spreadRadius: 0,
            )
          ],
        ),
        child: Stack(
          children: [
            Positioned(
                bottom: 00,
                child: Image.asset(
                  "assets/images/diamond_bar_one.png",
                  fit: BoxFit.cover,
                )),
            Positioned(
                bottom: 00,
                child: Image.asset(
                  "assets/images/diamond_bar_two.png",
                  fit: BoxFit.cover,
                )),
            Positioned(
                right: 28,
                bottom: 30,
                child: Column(
                  children: [
                    CommonTextWidget(
                      text: "MONTHLY",
                      color: Color(0xFF665600),
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                      fontSize: 14,
                    ),
                    CommonTextWidget(
                      text: "₹999.00",
                      color: Color(0xFF665600),
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CommonTextWidget(
                        text: "Membership",
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF444444),
                      ),
                      CommonTextWidget(
                        text: "Diamond Subscription",
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color(0xFF000000),
                      )
                    ],
                  ),
                  Image.asset("assets/images/diamond_image.png")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
