import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/core/theming/style.dart';

class QuickBiteTextForm extends StatelessWidget {
  final bool? obscureText;
  final TextEditingController? controllerText;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final String? labelText;
  final bool? autofocus;
  final Color? backgroundTextFilled;
  final String? Function(String?)? validator;
  const QuickBiteTextForm({
    super.key,
    this.obscureText,
    this.controllerText,
    this.contentPadding,
    this.focusedBorder,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.hintStyle,
    this.enabledBorder,
    this.labelText,
    this.labelStyle,
    this.autofocus,
    this.backgroundTextFilled,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.circular(14.r),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.circular(14.r),
            ),
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyles.font14WarmGrayRegular,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        labelText: labelText,
        labelStyle: labelStyle ?? TextStyles.font13WarmGrayMedium,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true,
        fillColor: backgroundTextFilled ?? ColorManager.whiteBackgroundColor,
      ),
      obscureText: obscureText ?? false,
      controller: controllerText,
      autofocus: autofocus ?? false,
      validator: validator,
    );
  }
}
