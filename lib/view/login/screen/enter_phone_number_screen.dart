import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zatayo/constant/app_color.dart';
import 'package:zatayo/cubit/skip/user_skip_cubit.dart';
import 'package:zatayo/cubit/skip/user_skip_state.dart';

import '../../../bloc/otp_bloc/otp_bloc.dart';
import '../../../utils/app_shared_preference_helper.dart';
import '../../common_widget/common_button_widget.dart';
import '../../common_widget/common_loading_indicator.dart';
import '../../common_widget/common_snack_bar_widget.dart';
import '../../common_widget/common_text_field_widget.dart';
import '../../common_widget/common_text_widget.dart';
import '../../common_widget/user_profile_set_string.dart';

class EnterPhoneNumberScreen extends StatelessWidget {
  static const String routeName = "/";
  EnterPhoneNumberScreen({super.key});

  final TextEditingController _phoneNumberTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.kPrimaryBackground,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 10),
                    child: BlocConsumer<UserSkipCubit, UserSkipState>(
                      listener: (BuildContext context, UserSkipState state) {
                        if(state is UserSkipLoading){
                          showCustomCupertinoDialog(context);
                        }
                        if (state is UserSkipSuccess) {
                          context.pop();
                          UserProfileSetString.instance.isUserSkip = "yes";
                          AppSharedPreferenceHelper().saveCustomerData(
                              "shutCustomerToken",
                              state.otpVerifyResponseModel.token ?? '');
                          context.push('/feed-page');
                        }
                      },
                      builder: (BuildContext context, UserSkipState state) {
                        return InkWell(
                          onTap: () {
                            context.read<UserSkipCubit>().skipLogin();
                          },
                          child: Text(
                            'Skip',
                            style: GoogleFonts.workSans(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 200),
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
                            height: 60,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: media.width,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Column(
                                    children: [
                                      const Row(
                                        children: [
                                          CommonTextWidget(
                                            text: 'Mobile Number',
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Container(
                                        height: 56,
                                        padding: const EdgeInsets.all(16),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFF23252B),
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                width: 1,
                                                color: Color(0xFFF8470E)),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          shadows: const [
                                            BoxShadow(
                                              color: Color(0x3FF97316),
                                              blurRadius: 0,
                                              offset: Offset(0, 0),
                                              spreadRadius: 4,
                                            )
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: SizedBox(
                                                width: double.infinity,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child:
                                                          CommonTextFieldWidget(
                                                        controller:
                                                            _phoneNumberTextEditingController,
                                                        // Use the controller

                                                        onSubmitted: (value) {
                                                          final phoneNumber =
                                                              _phoneNumberTextEditingController
                                                                  .text;

                                                          if (phoneNumber
                                                                  .isEmpty ||
                                                              phoneNumber
                                                                      .length !=
                                                                  10) {
                                                            showSSnackBar(
                                                                context,
                                                                "Please enter valid phoneNumber",
                                                                Colors.red);
                                                          } else {
                                                            context
                                                                .read<OtpBloc>()
                                                                .add(SendOtp(
                                                                    phoneNumber));
                                                          }
                                                        },
                                                        hintText:
                                                            "Mobile Number",
                                                        prefixIcon:
                                                            const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 5),
                                                          child:
                                                              Icon(Icons.phone),
                                                        ),
                                                        maxLength: 10,
                                                        // Character limit
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        // Number input
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .digitsOnly
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 60,
                                      ),
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
                                                              is OtpLoading
                                                          ? Colors.grey
                                                          : AppColor
                                                              .kPrimaryButtonColor,
                                                      onPressed: () {
                                                        if (state
                                                            is! OtpLoading) {
                                                          final phoneNumber =
                                                              _phoneNumberTextEditingController
                                                                  .text;

                                                          if (phoneNumber
                                                                  .isEmpty ||
                                                              phoneNumber
                                                                      .length !=
                                                                  10) {
                                                            showSSnackBar(
                                                                context,
                                                                "Please enter valid phoneNumber",
                                                                Colors.red);
                                                          } else {
                                                            context
                                                                .read<OtpBloc>()
                                                                .add(SendOtp(
                                                                    phoneNumber));
                                                          }
                                                        }
                                                      },
                                                      height: 56,
                                                      icon: Icons
                                                          .arrow_forward_ios_outlined,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              if (state is OtpLoading)
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
                                          if (state is OtpSentSuccess) {
                                            UserProfileSetString.instance.isUserSkip = "no";
                                            final argumentData = {
                                              'phoneNumber':
                                                  _phoneNumberTextEditingController
                                                      .text,
                                              'orderId': state
                                                  .sendOtpResponseModel.otp,
                                            };
                                            context.push('/verify-otp-screen',
                                                extra: argumentData);
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
