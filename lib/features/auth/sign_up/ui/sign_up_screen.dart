import 'package:flutter/material.dart';
import 'package:quick_bite/core/helpers/spasing.dart';
import 'package:quick_bite/core/theming/style.dart';
import 'package:quick_bite/core/widgets/app_button.dart';
import 'package:quick_bite/core/widgets/quick_bite_text_form.dart';
import 'package:quick_bite/features/auth/widgets/continue_with.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const QuickBiteTextForm(
            labelText: "Full Name",
            hintText: "Enter your full name",
          ),
          verticalSpacing(16),
          const QuickBiteTextForm(
            labelText: "Email",
            hintText: "Enter your email",
          ),
          verticalSpacing(16),
          const QuickBiteTextForm(
            labelText: "Password",
            obscureText: true,
            hintText: "Create a password",
          ),
          verticalSpacing(16),
          AppButton(textButton: "Sign Up", onPressed: () {}),
          verticalSpacing(16),
          Text(
            'By signing up, you agree to our Terms & Privacy Policy',
            style: TextStyles.font12DeepTerracottakRegular,
          ),
          verticalSpacing(16),
          ContinueWith(),
        ],
      ),
    );
  }
}
