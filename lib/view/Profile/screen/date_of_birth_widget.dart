import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant/app_color.dart';
import '../../../cubit/customer_details/update_user_profle_cubit.dart';
import '../../common_widget/common_container_widget.dart';
import '../../common_widget/common_text_widget.dart';
class DateOfBirthWidget extends StatefulWidget {
   final String dateOfBirth;
  const DateOfBirthWidget({required this.dateOfBirth,super.key});

  @override
  State<DateOfBirthWidget> createState() => _DateOfBirthWidgetState();
}

class _DateOfBirthWidgetState extends State<DateOfBirthWidget> {
  DateTime? selectedDate;
  late StreamSubscription subscription;

  DateTime? _parseDate(String dateString) {
    try {
      List<String> parts = dateString.split('/');
      if (parts.length == 3) {
        int day = int.parse(parts[0]);
        int month = int.parse(parts[1]);
        int year = int.parse(parts[2]);
        return DateTime(year, month, day);
      }
    } catch (e) {
      debugPrint('Error parsing date: $e');
    }
    return null; // Return null if parsing fails
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColor.kPrimaryButtonColor, // Header background & selected date
              onPrimary: Colors.black, // Header text color
              onSurface: Colors.black,
              surfaceBright: Colors.red,
              secondary: Colors.black
              // Default text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColor.kSecondaryButtonColor, // OK & CANCEL button color
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: AppColor.kSecondaryButtonColor.withOpacity(0.5), // Background color of text field
              hintStyle: const TextStyle(color: Colors.black54), // Hint text color
              labelStyle: const TextStyle(color: Colors.black), // Label text color

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.kSecondaryButtonColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.kSecondaryButtonColor, width: 2),
              ),
            ),
            textTheme: const TextTheme(
              titleMedium: TextStyle(color: Colors.black), // Changes the manual text input color
            ),
          ),

          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      getDateValue(selectedDate);
    }
  }
  getDateValue(dataValue){
    context.read<UpdateUserProfileCubit>().updateModel(
        dob: '${dataValue!.day}/${dataValue!.month}/${dataValue!.year}'
    );
  }

  @override
  void initState() {
    super.initState();
     subscription =  context.read<UpdateUserProfileCubit>().stream.listen((data){
      selectedDate = _parseDate(data.dob ?? '');
      setState(() {

      });
    });
  }


  @override
  void dispose() {
    // TODO: implement
    subscription.cancel();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              CommonTextWidget(text: "Date of Birth*"),
            ],
          ),
          const SizedBox(height: 14),
          GestureDetector(
            onTap: () => _selectDate(context),
            child: ContainerWidget(
              borderRadius: 4,
              width: double.infinity,
              borderColor: AppColor.kSecondaryButtonColor,
              height: 56,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: CommonTextWidget(
                      text: selectedDate != null
                          ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                          : "Select date",
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(Icons.calendar_today),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
