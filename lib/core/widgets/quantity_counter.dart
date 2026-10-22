import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/helpers/spasing.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/core/theming/style.dart';

class QuantityCounter extends StatelessWidget {
  final double? widthContainer;
  final double? heightContainer;
  final double? widthButton;
  final double? heightButton;
  final TextStyle? style;
  final Widget? child;
  final void Function()? add;
  final void Function()? decrease;
  const QuantityCounter({
    super.key,
    this.widthContainer,
    this.heightContainer,
    this.widthButton,
    this.heightButton,
    this.style,
    this.child,
    this.add,
    this.decrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthContainer ?? 108.w,
      height: heightContainer ?? 42.h,
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 6.w),
      decoration: BoxDecoration(
        color: ColorManager.whiteBackgroundColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorManager.grey),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: decrease ?? () {},
            child: Container(
              width: widthButton ?? 28.w,
              height: heightButton ?? 28.h,
              decoration: BoxDecoration(
                color: ColorManager.backgroundColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(Icons.remove),
            ),
          ),
          horizontalSpacing(6),
          SizedBox(
            width: 24.w,
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child:
                    child ??
                    Text(
                      "1",
                      maxLines: 1,
                      softWrap: false,
                      style: style ?? TextStyles.font15BlackSemiBold,
                    ),
              ),
            ),
          ),
          horizontalSpacing(6),
          InkWell(
            onTap: add ?? () {},
            child: Container(
              width: widthButton ?? 28.w,
              height: heightButton ?? 28.h,
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
