import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/theming/color.dart';

class IconButtonAppBar extends StatelessWidget {
  final IconData icon;
  final Color? colorIcon;
  final void Function()? action;
  final bool isBadge;
  const IconButtonAppBar({
    super.key,
    required this.icon,
    this.colorIcon,
    this.action,
    this.isBadge = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        width: 44.w,
        height: 44.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: ColorManager.grey),
        ),
        child: isBadge
            ? Center(
                child: Badge(
                  backgroundColor: ColorManager.red,
                  label: Text("0"),
                  child: Center(child: Icon(icon, color: colorIcon)),
                ),
              )
            : Icon(icon, color: colorIcon),
      ),
    );
  }
}
