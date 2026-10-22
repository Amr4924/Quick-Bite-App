import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quick_bite/core/Network/api_manager.dart';
import 'package:quick_bite/core/helpers/spasing.dart';
import 'package:quick_bite/core/routing/router.dart';
import 'package:quick_bite/core/widgets/app_button.dart';
import 'package:quick_bite/core/widgets/quick_bite_text_form.dart';
import 'package:quick_bite/features/auth/login/model/login_req_model.dart';
import 'package:quick_bite/features/auth/login/services/login_services.dart';
import 'package:quick_bite/features/auth/widgets/continue_with.dart';
import 'package:quick_bite/features/auth/login/ui/widgets/forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final ApiManager apiManager;
  late final LoginServices loginServices;
  bool isLoding = false;
  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          isLoding = true;
        });
        final response = await loginServices.login(
          LogInRecModel(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          ),
        );
        setState(() {
          isLoding = false;
        });
        if (!mounted) return;
        Navigator.pushNamed(context, Routes.homeScreen);
      } on DioException catch (e) {
        setState(() {
          isLoding = false;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    apiManager = ApiManager();
    loginServices = LoginServices(apiManager);
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            QuickBiteTextForm(
              controllerText: emailController,
              hintText: "Enter your Email",
              labelText: "Email",
              validator: (value) {
                String val = value!;
                if (val.isEmpty) {
                  return "The field is empty.";
                } else {
                  return null;
                }
              },
            ),
            verticalSpacing(20),
            QuickBiteTextForm(
              controllerText: passwordController,
              hintText: "Enter your password",
              labelText: "Password",
              obscureText: true,
              validator: (value) {
                String val = value!;
                if (val.isEmpty) {
                  return "The field is empty.";
                } else if (val.length < 8) {
                  return "Password less than 8";
                } else {
                  return null;
                }
              },
            ),
            verticalSpacing(20),
            const ForgotPassword(),
            verticalSpacing(20),
            AppButton(
              textButton: "Log In",
              onPressed: _login,
              isLoding: isLoding,
            ),
            verticalSpacing(20),
            const ContinueWith(),
          ],
        ),
      ),
    );
  }
}
