import 'package:flutter/material.dart';
import 'package:quick_bite/core/theming/style.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text("Create", style: TextStyles.font24BlackBold)),
      ],
    );
  }
}
