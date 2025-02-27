import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant/app_color.dart';
import '../../../cubit/customer_details/update_user_profle_cubit.dart';

class GenderDropDownWidget extends StatefulWidget {
  const GenderDropDownWidget({super.key});

  @override
  State<GenderDropDownWidget> createState() => _GenderDropDownWidgetState();
}

class _GenderDropDownWidgetState extends State<GenderDropDownWidget> {
  String? selectedGender;
  @override
  void initState() {
    // TODO: implement initState
    context.read<UpdateUserProfileCubit>().stream.listen((data) {
      if (mounted) {
        setState(() {
          // Only update if gender is "Male" or "Female"
          selectedGender = ["Male", "Female"].contains(data.gender) ? data.gender : null;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColor.kSecondaryButtonColor),
      ),
      width: double.infinity,
      height: 56,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedGender,
          hint: Text("Select gender"),
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down),
          items: ["Male", "Female"]
              .map((gender) => DropdownMenuItem(
            value: gender,
            child: Text(gender),
          ))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedGender = value;
            });
            context.read<UpdateUserProfileCubit>().updateModel(
                gender: value
            );
          },
        ),
      ),
    );
  }
}



