import 'package:flutter/material.dart';
import 'package:quick_bite/core/theming/style.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text("Forgot Password?", style: TextStyles.font14OrangeSemiBold),
      ),
    );
  }
}
