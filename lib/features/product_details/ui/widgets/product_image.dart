import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/features/home/data/product_model.dart';

class ProductImgae extends StatelessWidget {
  final ProductModel item;
  const ProductImgae({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 340.h,
      decoration: BoxDecoration(color: ColorManager.peachCream),
      child: Hero(
        tag: item.id,
        child: Image.network(item.img, fit: BoxFit.cover),
      ),
    );
  }
}
