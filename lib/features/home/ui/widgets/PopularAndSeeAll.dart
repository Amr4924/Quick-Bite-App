import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/core/theming/style.dart';

class PopularAndSeeAll extends StatelessWidget {
  const PopularAndSeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      height: 30.h,
      decoration: BoxDecoration(color: ColorManager.whiteBackgroundColor),
      child: Row(
        children: [
          Expanded(
            child: Text("Popular Picks", style: TextStyles.font17BlackSemiBold),
          ),
          TextButton(
            onPressed: () {},
            child: Text("See All", style: TextStyles.font12OrangeSemiBold),
          ),
        ],
      ),
    );
  }
}
