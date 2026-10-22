import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/helpers/spasing.dart';
import 'package:quick_bite/features/cart/widgets/app_bar_my_cart.dart';
import 'package:quick_bite/features/cart/widgets/checkout_section.dart';
import 'package:quick_bite/features/cart/widgets/diplay_product_cart.dart';
import 'package:quick_bite/features/cart/widgets/order_details.dart';

class CartScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBarMyCart(),
              verticalSpacing(18),
              const DiplayProductCart(),
              verticalSpacing(18),
              OrderDetails(),
              verticalSpacing(84),
              CheckoutSection(),
            ],
          ),
        ),
      ),
    );
  }
}
