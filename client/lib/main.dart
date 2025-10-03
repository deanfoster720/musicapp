import 'package:client/core/theme/theme.dart';
import 'package:client/features/auth/view/pages/signup_page.dart';
import 'package:flutter/material.dart';

void main() {
  // Entry point: bootstraps the widget tree with MyApp.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // App shell: sets global theme and initial route.
    return MaterialApp(
      title: 'musicapp',
      theme: AppTheme.darkThemeMode, // use our dark theme config
      home: const SignupPage(), // first screen shown on launch
    );
  }
}
