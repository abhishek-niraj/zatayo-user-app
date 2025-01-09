import 'package:flutter/material.dart';

import '../../common_widget/common_text_widget.dart';

class GoldPlan extends StatefulWidget {
 final  String price;
 final String subscriptionName;
  const GoldPlan({required this.price, required this.subscriptionName,super.key});

  @override
  State<GoldPlan> createState() => _GoldPlanState();
}

class _GoldPlanState extends State<GoldPlan> {
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
          color: const Color(0xFFFEDF39),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.28),
          ),
          shadows: const [
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
                left: -60,
                top: 20,
                child: SizedBox(
                  width: media.width * 0.68,
                  child: Image.asset(
                    "assets/images/diamong_round.png",
                    fit: BoxFit.cover,
                  ),
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
                      text: "₹${widget.price}.00",
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
                        text: widget.subscriptionName,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color(0xFF000000),
                      )
                    ],
                  ),
                  Image.asset("assets/images/sliver.png")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
