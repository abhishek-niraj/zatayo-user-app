import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:zatayo/constant/app_color.dart';
import 'package:zatayo/view/common_widget/common_button_widget.dart';

class ScannedBarcodeLabel extends StatelessWidget {
  const ScannedBarcodeLabel({
    super.key,
    required this.barcodes,
  });

  final Stream<BarcodeCapture> barcodes;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: barcodes,
      builder: (context, snapshot) {
        final scannedBarcodes = snapshot.data?.barcodes ?? [];

        if (scannedBarcodes.isEmpty) {
          return CommonButtonWidget(
              backgroundColor: Colors.grey,
              text: "Scaning ...", onPressed: (){

          });
        }
        else{
          return CommonButtonWidget(text: "Continue", onPressed: (){

          });
        }

      },
    );
  }
}
