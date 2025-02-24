import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:zatayo/constant/app_color.dart';
import 'package:zatayo/cubit/scann_bar_code/scan_bar_code_state.dart';
import 'package:zatayo/view/common_widget/common_button_widget.dart';
import 'package:zatayo/view/common_widget/common_snack_bar_widget.dart';

import '../../../cubit/scann_bar_code/scan_bar_code_cubit.dart';
import '../../common_widget/common_loading_indicator.dart';

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
              text: "Scanning ...",
              onPressed: () {});
        } else {
          final barcodeValue = scannedBarcodes.first.rawValue ?? "Unknown";

          return BlocConsumer<ScanBarCodeCubit, ScanBarCodeState>(
            builder: (BuildContext context, state) {
              return CommonButtonWidget(
                  text: "Continue",
                  onPressed: () {
                    final bodyRequest = {"qrNumber": barcodeValue};
                    // print("Scanned Barcode: $barcodeValue");
                    context.read<ScanBarCodeCubit>().scanBarCode(bodyRequest);
                  });
            },
            listener: (BuildContext context, state) {
              if (state is ScanBarCodeLoading) {
                showCustomCupertinoDialog(context);
              } else if (state is ScanBarCodeSuccess) {
                showSSnackBar(
                    context, state.commonResponseModel.message.toString(),
                    Colors.green);
                Navigator.pop(context);
              } else if (state is ScanBarCodeFail) {
                showSSnackBar(
                    context, state.commonResponseModel.message.toString(),
                    Colors.red);
                Navigator.pop(context);
              }
            },
          );
        }
      },
    );
  }
}
