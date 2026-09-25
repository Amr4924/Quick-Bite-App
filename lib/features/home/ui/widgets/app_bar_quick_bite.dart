import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/helpers/spasing.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/core/theming/style.dart';
import 'package:quick_bite/features/home/ui/widgets/icon_button_app_bar.dart';

class AppBarQuickBite extends StatelessWidget {
  const AppBarQuickBite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      padding: EdgeInsets.symmetric(vertical: 2.h),
      decoration: BoxDecoration(color: ColorManager.whiteBackgroundColor),
      child: Row(
        children: [
          Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: ColorManager.primaryColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              Icons.location_on_outlined,
              color: ColorManager.primaryColor,
            ),
          ),
          horizontalSpacing(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Deliver to",
                  style: TextStyles.font12DeepTerracottakRegular,
                ),
                verticalSpacing(2),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Aswan, Egypt",
                        style: TextStyles.font14BlackSemiBold,
                      ),
                      horizontalSpacing(4),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        weight: 12.w,
                        color: ColorManager.textSecondry,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButtonAppBar(
                icon: Icons.notifications_outlined,
                action: () {},
              ),
              horizontalSpacing(10),
              IconButtonAppBar(
                isBadge: true,
                icon: Icons.shopping_cart_outlined,
                action: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
