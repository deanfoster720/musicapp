import 'package:client/core/theme/app_pallete.dart';
import 'package:client/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:client/features/auth/view/widgets/custom_field.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Layout tuning in one place
  static const double _pad = 15.0;
  static const double _gapTitle = 30.0;
  static const double _gapField = 15.0;
  static const double _gapBeforeCta = 20.0;
  static const double _gapAfterCta = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Padding(
        padding: const EdgeInsets.all(_pad),

        // Vertically centered stack: title → fields → button → footer
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title
            const Text(
              'Sign Up.',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: _gapTitle),

            // Fields
            CustomField(hintText: 'Name'),

            const SizedBox(height: _gapField),

            CustomField(hintText: 'Email'),

            const SizedBox(height: _gapField),

            CustomField(hintText: 'Password'),

            const SizedBox(height: _gapBeforeCta),

            // Submit button (behavior lives inside this widget)
            AuthGradientButton(),

            const SizedBox(height: _gapAfterCta),

            // Sign-in prompt
            RichText(
              text: TextSpan(
                text: 'Already have an account? ',
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  TextSpan(
                    text: 'Sign In',
                    style: TextStyle(
                      color: Pallete.gradient2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
