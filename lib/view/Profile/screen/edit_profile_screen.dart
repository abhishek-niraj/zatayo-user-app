import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/app_router.dart';
import 'package:zatayo/view/common_widget/common_text_widget.dart';

import '../../../constant/app_color.dart';
import '../../common_widget/common_container_widget.dart';
import '../widget/profile_form.dart';
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const CommonTextWidget(text: "Edit Profile",
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
                      ContainerWidget(
                        borderRadius: 100,
                        height: 98,
                        width: 98,
                      ),
                      SizedBox(
                        height: 31,
                      ),
                      CommonTextWidget(
                        text: "Abhijeet Miashra",
                        fontWeight: FontWeight.w500,
                        fontSize: 21,
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
