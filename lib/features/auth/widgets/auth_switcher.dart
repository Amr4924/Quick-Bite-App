import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/core/theming/style.dart';
import 'package:quick_bite/core/widgets/app_button_switch.dart';
import 'package:quick_bite/features/auth/logic/cubit/auth_switch_cubit.dart';
import 'package:quick_bite/features/auth/logic/cubit/auth_switch_state.dart';

class AuthSwitcher extends StatelessWidget {
  const AuthSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthSwitchCubit, AuthSwitchState>(
      builder: (context, state) {
        return Container(
          width: 334.w,
          height: 48.h,
          decoration: BoxDecoration(
            color: const Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(color: ColorManager.grey),
          ),
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Row(
            children: [
              Expanded(
                child: AppButtoSwitch(
                  onTap: () {
                    context.read<AuthSwitchCubit>().switchLogin();
                  },
                  colorButton: state.isLogin
                      ? ColorManager.primaryColor
                      : ColorManager.backgroundColor,
                  child: Text(
                    "Log In",
                    style: TextStyles.font14WhiteSemiBold.copyWith(
                      color: state.isLogin
                          ? Colors.white
                          : ColorManager.textPrimary,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: AppButtoSwitch(
                  onTap: () {
                    context.read<AuthSwitchCubit>().switchSignUp();
                  },
                  colorButton: !state.isLogin
                      ? ColorManager.primaryColor
                      : ColorManager.backgroundColor,
                  child: Text(
                    "Sign Up",
                    style: TextStyles.font14WhiteSemiBold.copyWith(
                      color: !state.isLogin
                          ? Colors.white
                          : ColorManager.textPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
