import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/helpers/spasing.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/core/theming/style.dart';
import 'package:quick_bite/features/home/data/product_model.dart';
import 'package:quick_bite/features/home/logic/cubit/product_cubit.dart';
import 'package:quick_bite/core/widgets/quantity_counter.dart';

class AddToCartSection extends StatefulWidget {
  final ProductModel item;

  const AddToCartSection({super.key, required this.item});

  @override
  State<AddToCartSection> createState() => _AddToCartSectionState();
}

class _AddToCartSectionState extends State<AddToCartSection> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 88.h,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      decoration: BoxDecoration(color: ColorManager.whiteBackgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          QuantityCounter(
            child: Text('$quantity', style: TextStyles.font15BlackSemiBold),
            add: () {
              setState(() => quantity++);
            },
            decrease: () {
              if (quantity > 1) {
                setState(() => quantity--);
              }
            },
          ),
          horizontalSpacing(14),
          Expanded(
            child: InkWell(
              onTap: () {
                context.read<ProductCubit>().addToCart(
                  widget.item,
                  quantity: quantity,
                );
              },
              child: Container(
                width: 224.w,
                height: 56.h,
                decoration: BoxDecoration(
                  color: ColorManager.primaryColor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Center(
                  child: Text(
                    "Add to Cart",
                    style: TextStyles.font18WhiteSemiBold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
