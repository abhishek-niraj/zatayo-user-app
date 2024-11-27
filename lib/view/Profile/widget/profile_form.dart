import 'package:flutter/material.dart';
import 'package:zatayo/constant/app_color.dart';
import 'package:zatayo/view/common_widget/common_button_widget.dart';
import 'package:zatayo/view/common_widget/common_container_widget.dart';
import 'package:zatayo/view/common_widget/common_text_field_widget.dart';
import 'package:zatayo/view/common_widget/common_text_widget.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              CommonTextWidget(text: "Name*"),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 56,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    width: 1, color: AppColor.kSecondaryButtonColor),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: const CommonTextFieldWidget(
              hintText: "Abhishek Niraj",
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Row(
            children: [
              CommonTextWidget(text: "Date of Birth*"),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          const ContainerWidget(
            borderRadius: 4,
            width: double.infinity,
            borderColor: AppColor.kSecondaryButtonColor,
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: CommonTextWidget(text: "Select date"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.arrow_drop_down),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Row(
            children: [
              CommonTextWidget(text: "Gender*"),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          const ContainerWidget(
            borderRadius: 4,
            width: double.infinity,
            borderColor: AppColor.kSecondaryButtonColor,
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: CommonTextWidget(text: "Select gender"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.arrow_drop_down),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Row(
            children: [
              CommonTextWidget(text: "Height in Cms"),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            height: 56,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    width: 1, color: AppColor.kSecondaryButtonColor),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: const CommonTextFieldWidget(
              hintText: "Enter height",
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Row(
            children: [
              CommonTextWidget(text: "Weight in Kgs"),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            height: 56,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    width: 1, color: AppColor.kSecondaryButtonColor),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: const CommonTextFieldWidget(
              hintText: "Enter weight",
            ),
          ),
          SizedBox(
            height: 38,
          ),
          CommonButtonWidget(text: "Save",

              width: double.infinity,
              onPressed: () {}),

          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
