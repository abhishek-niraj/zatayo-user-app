import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final int? maxLength;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onSubmitted; // For handling text submission
  final Function (String) ? onChange;
  const CommonTextFieldWidget({
    super.key,
    this.hintText = '',
    this.controller,
    this.prefixIcon,
    this.maxLength,
    this.keyboardType = TextInputType.text, // Default to text
    this.inputFormatters,
    this.onSubmitted,
    this.onChange
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType, // Set the keyboard type
      inputFormatters: inputFormatters, // Set input formatters
      maxLength: maxLength, // Set character limit
      style: const TextStyle(color: Colors.white),
      onSubmitted: onSubmitted,
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        border: InputBorder.none, // Removes the underline
        isDense: true, // Reduces height of the text field
        contentPadding: EdgeInsets.zero, // Removes padding inside the text field
        counterText: '', // Hides the character counter
        prefixIconConstraints: const BoxConstraints(
          minWidth: 0, // Sets minimum width of the prefix icon
          minHeight: 0, // Sets minimum height of the prefix icon
        ),

      ),
    );
  }
}
