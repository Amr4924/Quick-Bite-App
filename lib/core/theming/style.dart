import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/core/theming/text_weight.dart';

class TextStyles {
  static TextStyle font26BlackBold = GoogleFonts.poppins(
    fontSize: 26.sp,
    fontWeight: TextWeightHelper.bold,
    color: ColorManager.textPrimary,
  );
  static TextStyle font24BlackBold = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: TextWeightHelper.bold,
    color: ColorManager.textPrimary,
  );
  static TextStyle font15WarmGrayRegular = GoogleFonts.poppins(
    fontSize: 15.sp,
    fontWeight: TextWeightHelper.regular,
    color: ColorManager.textSecondry,
  );
  static TextStyle font16WhiteSemiBold = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: TextWeightHelper.semiBold,
    color: Colors.white,
  );
  static TextStyle font14WarmGrayRegular = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: TextWeightHelper.regular,
    color: ColorManager.textSecondry,
  );
  static TextStyle font14WhiteSemiBold = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: TextWeightHelper.semiBold,
    color: Colors.white,
  );
  static TextStyle font13WarmGrayMedium = GoogleFonts.poppins(
    fontSize: 13.sp,
    fontWeight: TextWeightHelper.medium,
    color: ColorManager.textSecondry,
  );
  static TextStyle font13WarmGrayRegular = GoogleFonts.poppins(
    fontSize: 13.sp,
    fontWeight: TextWeightHelper.regular,
    color: ColorManager.textSecondry,
  );
  static TextStyle font13OrangeSemiBold = GoogleFonts.poppins(
    fontSize: 13.sp,
    fontWeight: TextWeightHelper.semiBold,
    color: ColorManager.primaryColor,
  );
  static TextStyle font14OrangeSemiBold = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: TextWeightHelper.semiBold,
    color: ColorManager.primaryColor,
  );
  static TextStyle font13DeepTerracottaRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: TextWeightHelper.regular,
    color: ColorManager.deepTerracotta,
  );
  static TextStyle font14BlackMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: TextWeightHelper.medium,
    color: ColorManager.textPrimary,
  );
}
