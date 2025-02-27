import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/app_router.dart';
import 'package:zatayo/view/common_widget/common_text_widget.dart';

import '../../../constant/app_color.dart';
import '../../../cubit/customer_details/customer_details_cubit.dart';
import '../../../cubit/customer_details/customer_details_state.dart';
import '../../common_widget/common_container_widget.dart';
import '../widget/profile_form.dart';
import '../widget/user_profile_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonTextWidget(
          text: "Edit Profile",
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF111214),
                    Color(0xFF6D1F06),
                  ],
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 56,
                      ),
                      UserProfileWidget(),
                      SizedBox(
                        height: 31,
                      ),
                      BlocBuilder<CustomerDetailsCubit, CustomerDetailsState>(
                        builder: (BuildContext context, state) {
                          if (state is GetCustomerDetailSuccess) {
                            return CommonTextWidget(
                              text:
                                  '${state.customerDetailsResponseModel.data?.first.name}',
                              fontWeight: FontWeight.w500,
                              fontSize: 21,
                            );
                          }
                          return SizedBox();
                        },
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push("/my-friends-screen");
                        },
                        child: CommonTextWidget(
                          text: "Edit Profile",
                          color: AppColor.kPrimaryButtonColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 56,
                      ),
                      ProfileForm()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
