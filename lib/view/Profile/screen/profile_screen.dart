import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/app_router.dart';
import 'package:zatayo/constant/app_color.dart';
import 'package:zatayo/view/common_widget/common_container_widget.dart';
import 'package:zatayo/view/common_widget/common_text_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        height: 150,
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
                          context.push("/edit-profile");
                        },
                        child: const CommonTextWidget(
                          text: "Edit Profile",
                          color: AppColor.kPrimaryButtonColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 56,
                      ),
                      Container(
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                            colors: [
                              Color(0xFFFDEA88),
                              Color(0xFFFFCB32),
                            ],
                          ),
                        ),
                      ),
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
