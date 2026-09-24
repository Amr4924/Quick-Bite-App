import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/helpers/spasing.dart';
import 'package:quick_bite/core/theming/style.dart';
import 'package:quick_bite/features/auth/logic/cubit/auth_switch_cubit.dart';
import 'package:quick_bite/features/auth/logic/cubit/auth_switch_state.dart';
import 'package:quick_bite/features/auth/login/ui/login_screen.dart';
import 'package:quick_bite/features/auth/sign_up/ui/sign_up_screen.dart';
import 'package:quick_bite/features/auth/widgets/auth_header.dart';
import 'package:quick_bite/features/auth/widgets/auth_switcher.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthSwitchCubit, AuthSwitchState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 56.h, horizontal: 28.w),
            child: Center(
              child: AnimatedSwitcher(
                switchInCurve: Curves.easeInCirc,
                switchOutCurve: Curves.easeInOutCirc,
                duration: Duration(milliseconds: 400),
                child: Column(
                  key: ValueKey<bool>(state.isLogin),
                  children: [
                    const AuthHeader(),
                    verticalSpacing(20),
                    const AuthSwitcher(),
                    verticalSpacing(25),
                    Expanded(
                      child: state.isLogin
                          ? const LoginScreen()
                          : const SignUpScreen(),
                    ),
                    RichText(
                      text: TextSpan(
                        text: state.isLogin
                            ? "Don't have an account? "
                            : 'Already have an account? ',
                        style: TextStyles.font13WarmGrayRegular,
                        children: [
                          TextSpan(
                            text: state.isLogin ? "Sign Up" : "Log In",
                            style: TextStyles.font13OrangeSemiBold,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                if (state.isLogin) {
                                  context
                                      .read<AuthSwitchCubit>()
                                      .switchSignUp();
                                } else {
                                  context.read<AuthSwitchCubit>().switchLogin();
                                }
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
