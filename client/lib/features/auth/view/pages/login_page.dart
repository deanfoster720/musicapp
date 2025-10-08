import 'package:client/core/theme/app_pallete.dart';
import 'package:client/features/auth/repositories/auth_remote_repository.dart';
import 'package:client/features/auth/view/pages/signup_page.dart';
import 'package:client/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:client/features/auth/view/widgets/custom_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Layout tuning in one place
  static const double _pad = 15.0;
  static const double _gapTitle = 30.0;
  static const double _gapField = 15.0;
  static const double _gapBeforeCta = 20.0;
  static const double _gapAfterCta = 20.0;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
    formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Padding(
        padding: const EdgeInsets.all(_pad),

        // Vertically centered stack: title → fields → button → footer
        child: Form(
          child: Column(
            key: formKey,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title
              const Text(
                'Sign In.',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: _gapTitle),

              CustomField(hintText: 'Email', controller: emailController),

              const SizedBox(height: _gapField),

              CustomField(
                hintText: 'Password',
                controller: passwordController,
                isObscureText: true,
              ),

              const SizedBox(height: _gapBeforeCta),

              // Submit button (behavior lives inside this widget)
              AuthGradientButton(
                buttonText: 'Sign in',
                onTap: () async {
                  await AuthRemoteRepository().login(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
              ),

              const SizedBox(height: _gapAfterCta),

              // Sign-in prompt
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupPage()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: const [
                      TextSpan(
                        text: 'Sign Up.',
                        style: TextStyle(
                          color: Pallete.gradient2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
