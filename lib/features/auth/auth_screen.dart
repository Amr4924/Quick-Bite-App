import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_bite/core/helpers/spasing.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/core/theming/style.dart';
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
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 56.h, horizontal: 28.w),
        child: Center(
          child: AnimatedSwitcher(
            switchInCurve: Curves.easeInCirc,
            switchOutCurve: Curves.easeInOutCirc,
            duration: Duration(milliseconds: 400),
            child: Column(
              key: ValueKey(isLogIn),
              children: [
                SvgPicture.asset('assets/svgs/quickBite_logo.svg'),
                verticalSpacing(20),
                Text(
                  isLogIn ? "Welcome Back" : "Create Account",
                  style: TextStyles.font24BlackBold,
                ),
                verticalSpacing(20),
                Text(
                  isLogIn
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
                            setState(() {
                              isLogIn = true;
                            });
                          },
                          child: Container(
                            width: 160.w,
                            height: 38.h,
                            decoration: BoxDecoration(
                              color: isLogIn
                                  ? ColorManager.primaryColor
                                  : ColorManager.backgroundColor,
                              borderRadius: BorderRadius.circular(11.r),
                            ),
                            child: Center(
                              child: Text(
                                "Log In",
                                style: TextStyles.font14WhiteSemiBold.copyWith(
                                  color: isLogIn
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
                            setState(() {
                              isLogIn = false;
                            });
                          },
                          child: Container(
                            width: 160.w,
                            height: 38.h,
                            decoration: BoxDecoration(
                              color: !isLogIn
                                  ? ColorManager.primaryColor
                                  : ColorManager.backgroundColor,
                              borderRadius: BorderRadius.circular(11.r),
                            ),
                            child: Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyles.font14WhiteSemiBold.copyWith(
                                  color: !isLogIn
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
                Expanded(child: isLogIn ? LoginScreen() : SignUpScreen()),
                RichText(
                  text: TextSpan(
                    text: isLogIn
                        ? "Don't have an account? "
                        : 'Already have an account? ',
                    style: TextStyles.font13WarmGrayRegular,
                    children: [
                      TextSpan(
                        text: isLogIn ? "Sign Up" : "Log In",
                        style: TextStyles.font13OrangeSemiBold,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              if (isLogIn) {
                                isLogIn = false;
                              } else {
                                isLogIn = true;
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
      ),
    );
  }
}
