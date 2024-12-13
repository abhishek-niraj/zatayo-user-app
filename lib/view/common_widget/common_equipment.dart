import 'package:flutter/material.dart';

import 'common_text_widget.dart';

class CommonEquipment extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const CommonEquipment(
      {required this.image,
      required this.title,
      required this.subtitle,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 38, height: 37, child: Image.asset(image)),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTextWidget(
              text: title,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: const Color(0xFFFFB23F)),
                ),
                const SizedBox(
                  width: 5,
                ),
                CommonTextWidget(
                    text: subtitle,
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                    color: const Color(0xFFFFB23F))
              ],
            )
          ],
        )
      ],
    );
  }
}
