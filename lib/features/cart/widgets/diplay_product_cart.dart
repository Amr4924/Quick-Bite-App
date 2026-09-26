import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/core/theming/style.dart';
import 'package:quick_bite/core/widgets/card_product.dart';
import 'package:quick_bite/core/widgets/quantity_counter.dart';
import 'package:quick_bite/features/home/data/product_model.dart';
import 'package:quick_bite/features/home/logic/cubit/product_cubit.dart';
import 'package:quick_bite/features/home/logic/cubit/product_state.dart';

class DiplayProductCart extends StatelessWidget {
  const DiplayProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (context.read<ProductCubit>().state.cart.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_checkout_outlined,
                    color: ColorManager.deepTerracotta,
                    size: 100,
                  ),
                  Text(
                    "The cart is empty",
                    style: TextStyles.font20BlackBold.copyWith(
                      color: ColorManager.deepTerracotta,
                    ),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: state.cart.length,
            itemBuilder: (context, i) {
              ProductModel item = state.cart[i];
              return Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: CardProduct(
                  item: state.cart[i],
                  actionProduct: SizedBox(
                    height: 105.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 12.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 22.w,
                            height: 22.h,
                            decoration: BoxDecoration(
                              color: ColorManager.backgroundColor,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: InkWell(
                              onTap: () {
                                context.read<ProductCubit>().removeFromCart(
                                  item,
                                );
                              },
                              child: Center(
                                child: Icon(
                                  Icons.close,
                                  size: 15,
                                  color: ColorManager.deepTerracotta,
                                ),
                              ),
                            ),
                          ),
                          QuantityCounter(
                            widthContainer: 104.w,
                            heightContainer: 32.h,
                            heightButton: 22.h,
                            widthButton: 22.w,
                            style: TextStyles.font13BlackSemiBold,
                            child: Text("${item.quantity}"),
                            add: () {
                              context.read<ProductCubit>().increaseCartQuantity(
                                item,
                              );
                            },
                            decrease: () {
                              context.read<ProductCubit>().decreaseCartQuantity(
                                item,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
