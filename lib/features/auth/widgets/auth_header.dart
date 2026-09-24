import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_bite/core/helpers/spasing.dart';
import 'package:quick_bite/core/theming/style.dart';
import 'package:quick_bite/features/auth/logic/cubit/auth_switch_cubit.dart';
import 'package:quick_bite/features/auth/logic/cubit/auth_switch_state.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthSwitchCubit, AuthSwitchState>(
      builder: (context, state) {
        return Column(
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
          ],
        );
      },
    );
  }
}
