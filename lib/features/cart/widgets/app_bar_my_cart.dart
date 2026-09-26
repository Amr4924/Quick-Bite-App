import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/helpers/spasing.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/core/theming/style.dart';

class AppBarMyCart extends StatelessWidget {
  const AppBarMyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      height: 44.w,
      decoration: BoxDecoration(color: ColorManager.whiteBackgroundColor),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 44.w,
              height: 44.h,
              padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 13.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.r),
                border: Border.all(color: ColorManager.grey),
              ),
              child: Icon(Icons.arrow_back_ios, size: 18),
            ),
          ),
          horizontalSpacing(14),
          Text("My Cart", style: TextStyles.font20BlackBold),
        ],
      ),
    );
  }
}
