import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/core/theming/style.dart';

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? textButton;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  bool isLoding;
  AppButton({
    super.key,
    this.onPressed,
    this.textButton,
    this.backgroundColor,
    this.height,
    this.width,
    this.isLoding = false,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 334.w,
      height: height ?? 58.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? ColorManager.primaryColor,
        ),
        onPressed: onPressed,

        child: isLoding
            ? CircularProgressIndicator(color: Colors.white)
            : Text(textButton ?? "", style: TextStyles.font16WhiteSemiBold),
      ),
    );
  }
}
