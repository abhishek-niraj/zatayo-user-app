import 'package:flutter/material.dart';




class ContainerWidget extends StatelessWidget {
  final double width;
  final double? height;
  final Color borderColor;
  final double borderRadius;
  final Color backgroundColor;
  final Widget ? child;
  final double ?  borderWidth ;
  const ContainerWidget(
      {super.key,
        this.width = double.infinity,
        this.height = 50,
        this.child,
        this.borderWidth,
        this.backgroundColor = Colors.transparent,
        this.borderColor = Colors.white,
        required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height:  height,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor,
              width: borderWidth ?? 1),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius)),
      child: child,
    );
  }
}
