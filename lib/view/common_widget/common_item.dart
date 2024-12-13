import 'package:flutter/material.dart';

import 'common_text_widget.dart';
class CommonItem extends StatefulWidget {
  const CommonItem({super.key});

  @override
  State<CommonItem> createState() => _CommonItemState();
}

class _CommonItemState extends State<CommonItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: double.infinity,
            height: 180,
            decoration: ShapeDecoration(
              image: const DecorationImage(
                image: AssetImage(
                    "assets/images/top_fitness_1.png"),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonTextWidget(text: "Planet Fitness and Gym",
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
              Row(
                children: [
                  Icon(Icons.star,
                    color: Colors.orange,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CommonTextWidget(text: '4.5')
                ],
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.location_on_outlined,
                size: 30,),
              CommonTextWidget(text: "California, New York",
                fontWeight: FontWeight.w400,
              )
            ],
          ),
        )
      ],
    );
  }
}
