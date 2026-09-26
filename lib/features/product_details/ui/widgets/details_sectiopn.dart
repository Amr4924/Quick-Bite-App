import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/helpers/spasing.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/core/theming/style.dart';
import 'package:quick_bite/features/home/data/product_model.dart';

class DetailsSection extends StatelessWidget {
  final ProductModel item;
  const DetailsSection({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.whiteBackgroundColor,
        borderRadius: BorderRadius.circular(28.r),
      ),
      width: double.infinity.w,
      height: 445.h,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorManager.secondry.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.h),
                child: Text(
                  item.category,
                  style: TextStyles.font12YelloSemiBold,
                ),
              ),
              verticalSpacing(11),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.nameProduct, style: TextStyles.font21BlackBold),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        color: ColorManager.secondry,
                        size: 16,
                      ),
                      horizontalSpacing(3),
                      Text(
                        "${item.rate}",
                        style: TextStyles.font13BlackSemiBold,
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpacing(11),
              Text(
                "\$${item.price}",
                style: TextStyles.font24BlackBold.copyWith(
                  color: ColorManager.primaryColor,
                ),
              ),
              verticalSpacing(11),
              Text(item.description, style: TextStyles.font14WarmGrayRegular),
            ],
          ),
        ),
      ),
    );
  }
}
