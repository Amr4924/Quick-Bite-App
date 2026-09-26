import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/helpers/spasing.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/core/theming/style.dart';

class QuantityCounter extends StatelessWidget {
  const QuantityCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105.w,
      height: 42.h,
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 6.w),
      decoration: BoxDecoration(
        color: ColorManager.whiteBackgroundColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorManager.grey),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              width: 28.w,
              height: 28.h,
              decoration: BoxDecoration(
                color: ColorManager.backgroundColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(Icons.remove),
            ),
          ),
          horizontalSpacing(14),
          Expanded(child: Text("1", style: TextStyles.font15BlackSemiBold)),
          horizontalSpacing(14),
          InkWell(
            onTap: () {},
            child: Container(
              width: 28.w,
              height: 28.h,
              decoration: BoxDecoration(
                color: ColorManager.backgroundColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
