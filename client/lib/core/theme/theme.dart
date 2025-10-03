import 'package:client/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // Reusable outline border factory so borders stay consistent across states.
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 3),
    borderRadius: BorderRadius.circular(10),
  );

  // Dark theme baseline with app-specific colors + input styling.
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,

    // Default decoration for all TextField/TextFormField widgets.
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27), // roomy touch target
      // Border when the field is enabled but not focused.
      enabledBorder: _border(Pallete.borderColor),

      // Border when the field is focused (uses accent/gradient color).
      focusedBorder: _border(Pallete.gradient2),
    ),
  );
}
