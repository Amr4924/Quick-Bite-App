import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_bite/core/Network/api_manager.dart';
import 'package:quick_bite/core/helpers/spasing.dart';
import 'package:quick_bite/core/theming/style.dart';
import 'package:quick_bite/core/widgets/app_button.dart';
import 'package:quick_bite/core/widgets/quick_bite_text_form.dart';
import 'package:quick_bite/features/auth/logic/cubit/auth_switch_cubit.dart';
import 'package:quick_bite/features/auth/sign_up/model/signup_req_model.dart';
import 'package:quick_bite/features/auth/sign_up/services/signup_services.dart';
import 'package:quick_bite/features/auth/widgets/continue_with.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final ApiManager apiManager;
  late final SignUpServices signupServices;
  bool isLoding = false;

  String? _validateFullName(String? value) {
    final fullName = value?.trim() ?? '';
    if (fullName.isEmpty) {
      return 'Please enter your full name.';
    }
    if (fullName.length < 2) {
      return 'Full name must be at least 2 characters.';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) {
      return 'Please enter your email.';
    }
    final emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailPattern.hasMatch(email)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    final password = value ?? '';
    if (password.isEmpty) {
      return 'Please enter a password.';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters.';
    }
    if (!RegExp(r'[A-Za-z]').hasMatch(password)) {
      return 'Password must contain at least one letter.';
    }
    if (!RegExp(r'\d').hasMatch(password)) {
      return 'Password must contain at least one number.';
    }
    return null;
  }

  Future<void> _signUp() async {
    ScaffoldMessenger.of(context).clearSnackBars();
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          isLoding = true;
        });
        final response = await signupServices.signup(
          SignupReqModel(
            email: emailController.text.trim(),
            fullname: nameController.text.trim(),
            password: passwordController.text.trim(),
          ),
        );
        setState(() {
          isLoding = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("SignUp successfu! Plz Login"),
            backgroundColor: Colors.green,
          ),
        );
        if (!mounted) return;
        context.read<AuthSwitchCubit>().switchLogin();
      } on DioException catch (e) {
        if (!mounted) return;
        setState(() {
          isLoding = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.message ?? 'Sign up failed.')));
      }
    }
  }

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    apiManager = ApiManager();
    signupServices = SignUpServices(apiManager);
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
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
              controllerText: nameController,
              labelText: "Full Name",
              hintText: "Enter your full name",
              validator: _validateFullName,
            ),
            verticalSpacing(16),
            QuickBiteTextForm(
              controllerText: emailController,
              labelText: "Email",
              hintText: "Enter your email",
              validator: _validateEmail,
            ),
            verticalSpacing(16),
            QuickBiteTextForm(
              controllerText: passwordController,
              labelText: "Password",
              obscureText: true,
              hintText: "Create a password",
              validator: _validatePassword,
            ),
            verticalSpacing(16),
            AppButton(
              textButton: "Sign Up",
              onPressed: _signUp,
              isLoding: isLoding,
            ),
            verticalSpacing(16),
            Text(
              'By signing up, you agree to our Terms & Privacy Policy',
              style: TextStyles.font12DeepTerracottakRegular,
            ),
            verticalSpacing(16),
            ContinueWith(),
          ],
        ),
      ),
    );
  }
}
