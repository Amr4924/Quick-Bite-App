import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/routing/app_router.dart';
import 'package:quick_bite/core/routing/router.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/features/auth/logic/cubit/auth_switch_cubit.dart';

class QuickBiteApp extends StatelessWidget {
  final AppRouter approuter;
  const QuickBiteApp({super.key, required this.approuter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => AuthSwitchCubit())],
        child: MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: ColorManager.backgroundColor,
            primaryColor: ColorManager.primaryColor,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.onboardingScreen,
          onGenerateRoute: approuter.generateRoute,
        ),
      ),
    );
  }
}
