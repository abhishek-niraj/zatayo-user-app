import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/constant/app_color.dart';
import 'package:zatayo/cubit/subscription_plan/subscription_plan_activation_cubit.dart';
import 'package:zatayo/cubit/subscription_plan/subscription_plan_activation_state.dart';
import 'package:zatayo/view/common_widget/common_text_widget.dart';

import '../../../cubit/customer_details/get_my_plan_information_cubit.dart';
import '../../common_widget/common_loading_indicator.dart';

class ServiceActivateWidget extends StatefulWidget {
  final int id;

  const ServiceActivateWidget({required this.id, super.key});

  @override
  State<ServiceActivateWidget> createState() => _ServiceActivateWidgetState();
}

class _ServiceActivateWidgetState extends State<ServiceActivateWidget> {
  bool light = false;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: BlocConsumer<SubscriptionPlanActivationCubit, SubscriptionPlanActivationState>(
        builder: (BuildContext context, state) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.kSecondaryButtonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45),
              ),
              elevation: 1,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 18),
            ),
            onPressed: () {
              final bodyRequest = {
                "id": widget.id,
                "subscriptionStatus": "Active"
              };
              context
                  .read<SubscriptionPlanActivationCubit>()
                  .activateSubscriptionPlan(bodyRequest);
              showCustomCupertinoDialog(context);

            },
            child: CommonTextWidget(text: "Activate"),
          );
        },
        listener: (BuildContext context, state) {
          if (state is SuccessActivationPlan) {
            context.read<GetMyPlanInformationCubit>().fetchMyPlan();
          }
        },
      ),
    );
  }
}

// return  Switch(
// // This bool value toggles the switch.
// value: light,
// activeColor: Colors.red,
// onChanged: (bool value) {
//
//
// // This is called when the user toggles the switch.
// setState(() {
// light = value;
// });
// },
// );
