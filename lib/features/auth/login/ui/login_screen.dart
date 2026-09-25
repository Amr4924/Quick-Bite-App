import 'package:flutter/material.dart';
import 'package:quick_bite/core/helpers/spasing.dart';
import 'package:quick_bite/core/widgets/app_button.dart';
import 'package:quick_bite/core/widgets/quick_bite_text_form.dart';
import 'package:quick_bite/features/auth/widgets/continue_with.dart';
import 'package:quick_bite/features/auth/login/ui/widgets/forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const QuickBiteTextForm(
              hintText: "Enter your Email",
              labelText: "Email",
            ),
            verticalSpacing(20),
            const QuickBiteTextForm(
              hintText: "Enter your password",
              labelText: "Password",
              obscureText: true,
            ),
            verticalSpacing(20),
            const ForgotPassword(),
            verticalSpacing(20),
            AppButton(textButton: "Log In", onPressed: () {}),
            verticalSpacing(20),
            const ContinueWith(),
          ],
        ),
      ),
    );
  }
}
