import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void showCustomCupertinoDialog(BuildContext context) {
  showCupertinoDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return PopScope(
        canPop: false, // Prevent back navigation
        child: Center(
          child: Container(
            width: 70, // Explicit width
            height: 70, // Explicit height
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: CupertinoActivityIndicator(
                radius: 15, // Adjust the size of the spinner
                color: Color(0xFFB7340B),
              ),
            ),
          ),
        ),
      );
    },
  );
}
