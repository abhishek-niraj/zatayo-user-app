import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zatayo/bloc/user_profile/user_profile_bloc.dart';
import 'package:zatayo/bloc/user_profile/user_profile_state.dart';
import 'package:zatayo/constant/app_color.dart';
import 'package:zatayo/cubit/customer_details/update_user_profle_cubit.dart';
import 'package:zatayo/view/Profile/widget/gender_drop_down_widget.dart';
import 'package:zatayo/view/common_widget/common_button_widget.dart';
import 'package:zatayo/view/common_widget/common_text_field_widget.dart';
import 'package:zatayo/view/common_widget/common_text_widget.dart';

import '../../../bloc/user_profile/user_profile_event.dart';
import '../../../cubit/customer_details/customer_details_cubit.dart';
import '../../../cubit/customer_details/customer_details_state.dart';
import '../screen/date_of_birth_widget.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController heightTextEditingController = TextEditingController();
  TextEditingController weightTextEditingController = TextEditingController();
  String dateOfBirth = "";

  late StreamSubscription _customerDetailsSubscription;

  @override
  void initState() {
    super.initState();

    context.read<CustomerDetailsCubit>().fetchCustomerDetails();

    _customerDetailsSubscription = context.read<CustomerDetailsCubit>().stream.listen((state) {
      if (state is GetCustomerDetailSuccess) {
        if (!mounted) return; // Ensure the widget is still mounted

        final customer = state.customerDetailsResponseModel.data?.first;
        if (customer != null) {
          nameTextEditingController.text = customer.name ?? "";
          heightTextEditingController.text = customer.height?.toString() ?? "";
          weightTextEditingController.text = customer.weight?.toString() ?? "";
          dateOfBirth = customer.dob ?? '';
        }


        setUserDataInCubit(customer?.name, customer?.dob, customer?.gender,
            customer?.height, customer?.weight);
      }
    });
  }

  @override
  void dispose() {
    _customerDetailsSubscription.cancel(); // Cancel subscription to prevent errors
    super.dispose();
  }

  void setUserDataInCubit(name, dob, gender, height, weight) {
    if (!mounted) return; // Ensure the widget is still active before using context

    context
        .read<UpdateUserProfileCubit>()
        .updateModel(name: name, dob: dob, gender: gender, height: height, weight: weight);
  }

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
            child: CommonTextFieldWidget(
              controller: nameTextEditingController,
              hintText: "Name",
              onChange: (value) {
                // UpdateUserProfileCubit

                context.read<UpdateUserProfileCubit>().updateModel(name: value);
              },
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          DateOfBirthWidget(
            dateOfBirth: dateOfBirth,
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
          GenderDropDownWidget(),
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
            child: CommonTextFieldWidget(
              controller: heightTextEditingController,
              hintText: "Enter height",
              keyboardType: TextInputType.number,
              onChange: (value) {
                context
                    .read<UpdateUserProfileCubit>()
                    .updateModel(height: value);
              },
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
            child: CommonTextFieldWidget(
              controller: weightTextEditingController,
              hintText: "Enter weight",
              keyboardType: TextInputType.number,

              onChange: (value) {
                context
                    .read<UpdateUserProfileCubit>()
                    .updateModel(weight: value);
              },
            ),
          ),
          SizedBox(
            height: 38,
          ),
          Builder(builder: (context) {
            final updateUserProfileCubit =
                context.watch<UpdateUserProfileCubit>();
            if (updateUserProfileCubit.state.name != null &&
                updateUserProfileCubit.state.name!.isNotEmpty &&
                updateUserProfileCubit.state.dob != null &&
                updateUserProfileCubit.state.dob!.isNotEmpty &&
                updateUserProfileCubit.state.gender != null &&
                updateUserProfileCubit.state.gender!.isNotEmpty) {
              return BlocConsumer<UserProfileBloc, UserProfileState>(
                builder: (BuildContext context, userProfileState) {
                  return CommonButtonWidget(
                    text: userProfileState is UpdateUserProfileLoading
                        ? "Loading...."
                        : "Save",
                    width: double.infinity,
                    onPressed: () {
                      final bodyRequest = {
                        "name": updateUserProfileCubit.state.name,
                        "dob": updateUserProfileCubit.state.dob,
                        "gender": updateUserProfileCubit.state.gender,
                        "height": updateUserProfileCubit.state.height,
                        "weight": updateUserProfileCubit.state.weight
                      };
                      print(updateUserProfileCubit.state.toJson());
                      if (userProfileState is! UpdateUserProfileLoading) {
                        context.read<UserProfileBloc>().add(UpdateUserProfile(
                              bodyRequest: bodyRequest,
                          image: updateUserProfileCubit.state.userProfileImage
                            ));
                      }
                    },
                  );
                },
                listener: (BuildContext context, userProfileState) {
                  if (userProfileState is UpdateUserProfileSuccess &&
                      ModalRoute.of(context)?.isCurrent == true) {
                    context.read<CustomerDetailsCubit>().fetchCustomerDetails();
                    Navigator.pop(context);
                    context.read<UpdateUserProfileCubit>().clearCubitOfUpdateUserProfileCunit();
                  }
                },
              );
            }

            return CommonButtonWidget(
              backgroundColor: Colors.grey,
              text: "Save",
              width: double.infinity,
              onPressed: () {},
            );
          }),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
