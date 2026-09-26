import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/theming/color.dart';

class IconButtonApp extends StatelessWidget {
  final void Function()? action;
  final Color? backgroundColor;
  final double? radius;
  final Widget? child;
  const IconButtonApp({
    super.key,
    this.action,
    this.backgroundColor,
    this.radius,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          action ??
          () {
            Navigator.pop(context);
          },
      child: CircleAvatar(
        backgroundColor: backgroundColor ?? ColorManager.whiteBackgroundColor,
        radius: radius ?? 20.r,
        child: child ?? Icon(Icons.arrow_back_ios, size: 18),
      ),
    );
  }
}
