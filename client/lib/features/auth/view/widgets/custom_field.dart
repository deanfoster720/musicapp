import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  // Placeholder text shown when the field is empty (e.g., "Email", "Password").
  final String hintText;

  const CustomField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    // Reusable text form field. Add validators/controllers upstream if needed.
    return TextFormField(
      // Sets the hint.
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
