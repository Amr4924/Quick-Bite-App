import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/core/theming/style.dart';

class CategoryProduct extends StatelessWidget {
  const CategoryProduct({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categorysName = ["All", "Burgers", "Pizza", "Drinks", "Sides"];
    return Container(
      decoration: BoxDecoration(color: ColorManager.whiteBackgroundColor),
      height: 42.h,
      width: double.infinity.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categorysName.length,
        itemBuilder: (context, i) {
          String category = categorysName[i];
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
              decoration: BoxDecoration(
                color: i == 0
                    ? ColorManager.primaryColor
                    : ColorManager.whiteBackgroundColor,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: ColorManager.grey),
              ),
              child: Text(
                category,
                style: i == 0
                    ? TextStyles.font13WarmGrayMedium.copyWith(
                        color: ColorManager.whiteBackgroundColor,
                      )
                    : TextStyles.font13WarmGrayMedium,
              ),
            ),
          );
        },
      ),
    );
  }
}
