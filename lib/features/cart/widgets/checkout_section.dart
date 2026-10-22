import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/core/widgets/app_button.dart';
import 'package:quick_bite/features/home/logic/cubit/product_cubit.dart';

class CheckoutSection extends StatelessWidget {
  const CheckoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      height: 88.h,
      decoration: BoxDecoration(color: ColorManager.whiteBackgroundColor),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      child: AppButton(
        onPressed: () {},
        textButton: () {
          final state = context.watch<ProductCubit>().state;
          final total = state.totalPrice + state.deliveryPrice;
          return "Checkout • \$ ${total.toStringAsFixed(2)}";
        }(),
      ),
    );
  }
}
