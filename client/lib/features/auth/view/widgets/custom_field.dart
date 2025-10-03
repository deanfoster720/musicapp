import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  // Placeholder text shown when the field is empty (e.g., "Email", "Password").
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;

  const CustomField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    // Reusable text form field. Add validators/controllers upstream if needed.
    return TextFormField(
      controller: controller,
      // Sets the hint.
      decoration: InputDecoration(hintText: hintText),
      validator: (val) {
        if (val!.trim().isEmpty) {
          return "$hintText is missing!";
        }
        return null;
      },
      obscureText: isObscureText,
    );
  }
}
