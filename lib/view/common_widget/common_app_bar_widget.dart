import 'package:flutter/material.dart';
import 'package:zatayo/view/common_widget/common_text_widget.dart';

class CommonAppBarWidget extends StatelessWidget {
  final String title;

  const CommonAppBarWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return CommonTextWidget(text: title,
    fontSize: 18,
      fontWeight: FontWeight.w600,

    );
  }
}
