import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/helpers/spasing.dart';
import 'package:quick_bite/features/home/ui/widgets/PopularAndSeeAll.dart';
import 'package:quick_bite/features/home/ui/widgets/app_bar_quick_bite.dart';
import 'package:quick_bite/features/home/ui/widgets/category.dart';
import 'package:quick_bite/features/home/ui/widgets/display_iteam.dart';
import 'package:quick_bite/features/home/ui/widgets/home_search_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBarQuickBite(),
                verticalSpacing(20),
                const HomeSearchHeader(),
                verticalSpacing(20),
                const CategoryProduct(),
                verticalSpacing(20),
                const PopularAndSeeAll(),
                verticalSpacing(20),
                const Displayitem(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
