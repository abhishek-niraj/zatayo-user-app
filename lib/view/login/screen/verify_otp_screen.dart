import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:zatayo/bloc/otp_bloc/otp_bloc.dart';
import 'package:zatayo/constant/app_color.dart';
import 'package:zatayo/view/common_widget/common_snack_bar_widget.dart';

import '../../../utils/app_shared_preference_helper.dart';
import '../../common_widget/common_button_widget.dart';
import '../../common_widget/common_text_widget.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final argumentData =
        GoRouterState.of(context).extra as Map<String, dynamic>;
    const focusedBorderColor = AppColor.kPrimaryButtonColor;
    // const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = AppColor.kPrimaryButtonColor;

    final defaultPinTheme = PinTheme(
      width: 53,
      height: 53,
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF23252B), // Background color of the pin
        borderRadius: BorderRadius.circular(4), // Rounded corners
        border: Border.all(
          color: const Color(0xFFF8470E), // Border color
          width: 1, // Border width
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3FF97316), // Shadow color
            blurRadius: 0, // No blur effect
            spreadRadius: 4, // Spread radius for shadow
            offset: Offset(0, 0), // No offset (shadow directly under the pin)
          ),
        ],
      ),
    );
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kPrimaryBackground,
        leading: IconButton(
          icon: Center(
            child: SvgPicture.asset(
              'assets/images/back_button.svg',
              semanticsLabel: 'My SVG Image',
            ),
          ), // Customize the icon here
          onPressed: () {
            Navigator.of(context).pop(); // This will handle the back navigation
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 140),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Sign In To Zatayo',
                            style: GoogleFonts.workSans(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    'Strength Unleashed, Power Redefined',
                                    style: GoogleFonts.workSans(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          letterSpacing: -0.3),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          const Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: CommonTextWidget(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.2,
                                      text:
                                          "Please enter the code we just send to "),
                                ),
                              ),
                            ],
                          ),
                           Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: CommonTextWidget(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.2,
                                      text: "(+91) ${argumentData['phoneNumber']} to proceed"),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Form(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Directionality(
                                    // Specify direction if desired
                                    textDirection: TextDirection.ltr,
                                    child: Pinput(
                                      length: 6,
                                      controller: pinController,
                                      focusNode: focusNode,
                                      separatorBuilder: (index) =>
                                          const SizedBox(width: 16),
                                      defaultPinTheme: defaultPinTheme,

                                      // onClipboardFound: (value) {
                                      //   debugPrint('onClipboardFound: $value');
                                      //   pinController.setText(value);
                                      // },

                                      hapticFeedbackType:
                                          HapticFeedbackType.lightImpact,
                                      onCompleted: (pin) {
                                        // Navigator.pushNamed(context, DashboardScreen.routeName);
                                        debugPrint('onCompleted: $pin');
                                        final bodyRequest = {
                                          "email": "",
                                          "orderId": argumentData['orderId'],
                                          "otp": pin,
                                          "phoneNumber":
                                              argumentData['phoneNumber'],
                                          "fcmToken": "yyhh"
                                        };
                                        context.read<OtpBloc>().add(VerifyOtp(
                                            bodyRequest: bodyRequest));
                                      },
                                      onChanged: (value) {
                                        // debugPrint('onChanged: $value');
                                        // setState(() {
                                        //
                                        // });
                                      },
                                      cursor: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 9),
                                            width: 22,
                                            height: 1,
                                            color: focusedBorderColor,
                                          ),
                                        ],
                                      ),
                                      focusedPinTheme: defaultPinTheme.copyWith(
                                        decoration: defaultPinTheme.decoration!
                                            .copyWith(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: focusedBorderColor),
                                        ),
                                      ),
                                      submittedPinTheme:
                                          defaultPinTheme.copyWith(
                                        decoration: defaultPinTheme.decoration!
                                            .copyWith(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: focusedBorderColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                CommonTextWidget(text: "Didn't receive OTP ? "),
                                Spacer(),
                                CommonTextWidget(text: "Resend OTP in (00:29)"),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: media.width,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Column(
                                    children: [
                                      BlocConsumer<OtpBloc, OtpState>(
                                        builder: (BuildContext context,
                                            OtpState state) {
                                          return Stack(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: CommonButtonWidget(
                                                      text: 'Continue',
                                                      backgroundColor: state
                                                              is VerifyOtpLoading
                                                          ? Colors.grey
                                                          : AppColor
                                                              .kPrimaryButtonColor,
                                                      onPressed: () {
                                                        if (state
                                                            is! VerifyOtpLoading) {
                                                          final bodyRequest = {
                                                            "email": "",
                                                            "orderId":
                                                                argumentData[
                                                                    'orderId'],
                                                            "otp": pinController
                                                                .text,
                                                            "phoneNumber":
                                                                argumentData[
                                                                    'phoneNumber'],
                                                            "fcmToken": "yyhh"
                                                          };
                                                          context
                                                              .read<OtpBloc>()
                                                              .add(VerifyOtp(
                                                                  bodyRequest:
                                                                      bodyRequest));
                                                        }
                                                      },
                                                      height: 56,
                                                      icon: Icons
                                                          .arrow_forward_ios_outlined,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              if (state is VerifyOtpLoading)
                                                const Positioned(
                                                  left: 0,
                                                  right: 0,
                                                  top: 0,
                                                  bottom: 0,
                                                  child: Center(
                                                    child: SizedBox(
                                                        width: 30,
                                                        height: 30,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: AppColor
                                                              .kPrimaryButtonColor,
                                                        )),
                                                  ),
                                                ),
                                            ],
                                          );
                                        },
                                        listener: (BuildContext context,
                                            OtpState state) {
                                          if (state is VerifyOtpSuccess) {
                                            AppSharedPreferenceHelper()
                                                .saveCustomerData(
                                                    "shutCustomerToken",
                                                    state.otpVerifyResponseModel
                                                            .token ??
                                                        '');
                                            context.push(
                                              '/user-name-screen',
                                            );
                                          } else if (state is VerifyOtpFail) {
                                            showSSnackBar(
                                                context,
                                                state.commonResponseModel
                                                        .message ??
                                                    '',
                                                Colors.red);
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
