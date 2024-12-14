import 'package:flutter/material.dart';
import 'package:zatayo/view/common_widget/common_container_widget.dart';
import 'package:zatayo/view/common_widget/common_text_widget.dart';

import '../../common_widget/common_app_bar_widget.dart';

class SuccessPayment extends StatefulWidget {
  static const String routeName = "/payment-success";

  const SuccessPayment({super.key});

  @override
  State<SuccessPayment> createState() => _SuccessPaymentState();
}

class _SuccessPaymentState extends State<SuccessPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonAppBarWidget(title: "Success payment"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              Colors.transparent,
              Color(0xFFB7340B),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 67,
                    ),
                    SizedBox(
                      height: 104,
                      width: 104,
                      child: ContainerWidget(
                          borderRadius: 100,
                          child: Image.asset("assets/images/payment_done.png")),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CommonTextWidget(text: "Paying Doordash",
                    fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    CommonTextWidget(text: "doordashupi@axisbank",
                     fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xFFCCCCCC),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    CommonTextWidget(text: '₹999.00',
                    fontSize: 58,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 38,
                    ),
                    CommonTextWidget(text: 'Doordash Order Id 151091256777',
                    fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Color(0xFFCCCCCC),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
