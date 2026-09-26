import 'package:flutter/material.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/core/theming/style.dart';

class SummaryRow extends StatelessWidget {
  final String title;
  final String price;
  final TextStyle? stylePrice;
  final TextStyle? styleTitle;
  const SummaryRow({
    super.key,
    required this.title,
    required this.price,
    this.stylePrice,
    this.styleTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: styleTitle ?? TextStyles.font13WarmGrayRegular),
        Text(
          price,
          style:
              stylePrice ??
              TextStyles.font13WarmGrayMedium.copyWith(
                color: ColorManager.textPrimary,
              ),
        ),
      ],
    );
  }
}
