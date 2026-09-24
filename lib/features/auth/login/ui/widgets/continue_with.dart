import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/helpers/spasing.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/core/theming/style.dart';

class ContinueWith extends StatelessWidget {
  const ContinueWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: ColorManager.grey, thickness: 1)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                "or continue with",
                style: TextStyles.font13DeepTerracottaRegular,
              ),
            ),
            Expanded(child: Divider(color: ColorManager.grey, thickness: 1)),
          ],
        ),
        verticalSpacing(20),
        Container(
          width: 334.w,
          height: 50.h,
          color: ColorManager.whiteBackgroundColor,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorManager.whiteBackgroundColor,
                      borderRadius: BorderRadius.circular(14.r),
                      border: Border.all(color: ColorManager.grey, width: 1.w),
                    ),
                    child: Center(
                      child: Text(
                        "Google",
                        style: TextStyles.font14BlackMedium,
                      ),
                    ),
                  ),
                ),
              ),
              horizontalSpacing(12),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorManager.whiteBackgroundColor,
                      borderRadius: BorderRadius.circular(14.r),
                      border: Border.all(color: ColorManager.grey, width: 1.w),
                    ),
                    child: Center(
                      child: Text("Apple", style: TextStyles.font14BlackMedium),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
