import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/theming/color.dart';

class AppButtoSwitch extends StatelessWidget {
  final void Function()? onTap;
  final Color? colorButton;
  final Color? borderColor;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final double? width;
  final double? height;
  const AppButtoSwitch({
    super.key,
    this.onTap,
    this.colorButton,
    this.child,
    this.borderRadius,
    this.width,
    this.height,
    this.borderColor,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 160.w,
        height: height ?? 38.h,
        decoration: BoxDecoration(
          color: colorButton ?? ColorManager.backgroundColor,
          borderRadius: borderRadius ?? BorderRadius.circular(11.r),
          border:
              border ??
              Border.all(color: borderColor ?? ColorManager.backgroundColor),
        ),
        child: Center(child: child),
      ),
    );
  }
}
