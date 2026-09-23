import 'package:flutter/material.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/core/theming/text_weight.dart';

class TextStyles {
  static TextStyle font26BlackBold = TextStyle(
    fontSize: 26,
    fontWeight: TextWeightHelper.bold,
    color: ColorManager.textPrimary,
  );
  static TextStyle font15WarmGrayRegular = TextStyle(
    fontSize: 15,
    fontWeight: TextWeightHelper.regular,
    color: ColorManager.textSecondry,
  );
  static TextStyle font16WWhiteSemiBold = TextStyle(
    fontSize: 15,
    fontWeight: TextWeightHelper.semiBold,
    color: Colors.white,
  );
}
