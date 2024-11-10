import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/bloc/user_profile/user_profile_bloc.dart';
import 'package:zatayo/bloc/user_profile/user_profile_event.dart';
import 'package:zatayo/bloc/user_profile/user_profile_state.dart';
import 'package:zatayo/view/common_widget/common_button_widget.dart';
import 'package:zatayo/view/common_widget/common_text_field_widget.dart';
import 'package:zatayo/view/common_widget/common_text_widget.dart';

import '../../../constant/app_color.dart';

class UserNameScreen extends StatelessWidget {
  UserNameScreen({super.key});

  final TextEditingController nameTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            context.pop();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonTextWidget(
                text: "Greetings, champion!",
                fontWeight: FontWeight.w700,
                fontSize: 30,
                letterSpacing: -1,
              ),
              const SizedBox(
                height: 11,
              ),
              const CommonTextWidget(
                text: "Enter Your Name",
                fontWeight: FontWeight.w700,
                fontSize: 30,
                letterSpacing: -1,
              ),
              const SizedBox(
                height: 76,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 56,
                      padding: const EdgeInsets.all(16),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF23252B),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 1, color: Color(0xFFF8470E)),
                          borderRadius: BorderRadius.circular(4),
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
                      child: CommonTextFieldWidget(
                        hintText: "Name",
                        controller: nameTextEditingController,
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(Icons.person),
                        ),
                        maxLength: 30,
                        // Character limit
                        keyboardType: TextInputType.text,
                        // Number input
                        inputFormatters: const [],
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              BlocConsumer<UserProfileBloc, UserProfileState>(
                builder: (BuildContext context, UserProfileState state) {
                  return Stack(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CommonButtonWidget(
                              text: "Continue",
                              backgroundColor: state is UpdateUserProfileLoading
                                  ? Colors.grey
                                  : AppColor.kPrimaryButtonColor,
                              onPressed: () {
                                final bodyRequest = {
                                  "name": nameTextEditingController.text
                                };
                                if (state is! UpdateUserProfileLoading) {
                                  context
                                      .read<UserProfileBloc>()
                                      .add(UpdateUserProfile(
                                        bodyRequest: bodyRequest,
                                      ));
                                }

                                context.push(
                                  '/feed-page',
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      if (state is UpdateUserProfileLoading)
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
                listener: (BuildContext context, UserProfileState state) {},
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
