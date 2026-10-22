import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_bite/core/helpers/spasing.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/core/theming/style.dart';
import 'package:quick_bite/features/auth/logic/cubit/auth_switch_cubit.dart';
import 'package:quick_bite/features/auth/logic/cubit/auth_switch_state.dart';
import 'package:quick_bite/features/auth/login/ui/login_screen.dart';
import 'package:quick_bite/features/auth/sign_up/ui/sign_up_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogIn = true;
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
                  key: ValueKey(state.isLogin),
                  children: [
                    SvgPicture.asset('assets/svgs/quickBite_logo.svg'),
                    verticalSpacing(20),
                    Text(
                      state.isLogin ? "Welcome Back" : "Create Account",
                      style: TextStyles.font24BlackBold,
                    ),
                    verticalSpacing(20),
                    Text(
                      state.isLogin
                          ? "Log in to continue ordering your\nfavorites"
                          : "Sign up to start ordering your favorite\nmeals",
                      style: TextStyles.font14WarmGrayRegular,
                      textAlign: TextAlign.center,
                    ),
                    verticalSpacing(20),
                    Container(
                      width: 334.w,
                      height: 48.h,
                      color: Color(0xffFFFFFF),
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                context.read<AuthSwitchCubit>().switchLogin();
                              },
                              child: Container(
                                width: 160.w,
                                height: 38.h,
                                decoration: BoxDecoration(
                                  color: state.isLogin
                                      ? ColorManager.primaryColor
                                      : ColorManager.backgroundColor,
                                  borderRadius: BorderRadius.circular(11.r),
                                ),
                                child: Center(
                                  child: Text(
                                    "Log In",
                                    style: TextStyles.font14WhiteSemiBold
                                        .copyWith(
                                          color: state.isLogin
                                              ? Colors.white
                                              : ColorManager.textPrimary,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                context.read<AuthSwitchCubit>().switchSignUp();
                              },
                              child: Container(
                                width: 160.w,
                                height: 38.h,
                                decoration: BoxDecoration(
                                  color: !state.isLogin
                                      ? ColorManager.primaryColor
                                      : ColorManager.backgroundColor,
                                  borderRadius: BorderRadius.circular(11.r),
                                ),
                                child: Center(
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyles.font14WhiteSemiBold
                                        .copyWith(
                                          color: !state.isLogin
                                              ? Colors.white
                                              : ColorManager.textPrimary,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpacing(25),
                    Expanded(
                      child: state.isLogin ? LoginScreen() : SignUpScreen(),
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
                                setState(() {
                                  if (isLogIn) {
                                    context
                                        .read<AuthSwitchCubit>()
                                        .switchSignUp();
                                  } else {
                                    context
                                        .read<AuthSwitchCubit>()
                                        .switchLogin();
                                  }
                                });
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
