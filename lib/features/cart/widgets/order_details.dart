import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/helpers/spasing.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/core/theming/style.dart';
import 'package:quick_bite/features/cart/widgets/order_summary_row.dart';
import 'package:quick_bite/features/home/logic/cubit/product_cubit.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      height: 159.h,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: ColorManager.whiteBackgroundColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SummaryRow(
            title: "Subtotal",
            price:
                "\$${(context.watch<ProductCubit>().state.totalPrice).toStringAsFixed(2)}",
          ),
          verticalSpacing(10),
          SummaryRow(
            title: "Delivery Fee",
            price:
                "\$${context.watch<ProductCubit>().state.deliveryPrice.toStringAsFixed(2)}",
          ),
          verticalSpacing(10),
          SummaryRow(
            title: "Discount",
            price: "\$${0.00.toStringAsFixed(2)}",
            stylePrice: TextStyles.font13WarmGrayMedium.copyWith(
              color: ColorManager.green,
            ),
          ),
          Divider(color: ColorManager.grey, thickness: 1),
          verticalSpacing(10),
          SummaryRow(
            title: "Total",
            price:
                "\$${(context.watch<ProductCubit>().state.totalPrice + context.watch<ProductCubit>().state.deliveryPrice).toStringAsFixed(2)}",
            styleTitle: TextStyles.font16WhiteSemiBold.copyWith(
              color: ColorManager.textPrimary,
            ),
            stylePrice: TextStyles.font17WhiteSemiBold,
          ),
        ],
      ),
    );
  }
}
