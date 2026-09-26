import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/helpers/spasing.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/core/widgets/icon_button_app.dart';
import 'package:quick_bite/features/home/data/product_model.dart';
import 'package:quick_bite/features/home/logic/cubit/product_cubit.dart';
import 'package:quick_bite/features/home/logic/cubit/product_state.dart';
import 'package:quick_bite/features/product_details/ui/widgets/add_to_cart_section.dart';
import 'package:quick_bite/features/product_details/ui/widgets/details_sectiopn.dart';
import 'package:quick_bite/features/product_details/ui/widgets/product_image.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel item;
  const ProductDetails({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final product = state.produts.firstWhere(
          (item) => item.id == item.id,
          orElse: () => item,
        );
        return Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: 740.h,
                child: Stack(
                  children: [
                    ProductImgae(item: item),
                    Positioned(
                      top: 24,
                      left: 24,
                      right: 24,
                      child: SafeArea(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButtonApp(),
                            IconButtonApp(
                              action: () {
                                context
                                    .read<ProductCubit>()
                                    .toggleStateFavorite(product);
                              },
                              child: AnimatedSwitcher(
                                duration: Duration(milliseconds: 600),
                                child: product.isFavorite
                                    ? Icon(
                                        key: ValueKey("favorite"),
                                        Icons.favorite,
                                        size: 18,
                                        color: ColorManager.primaryColor,
                                      )
                                    : Icon(
                                        key: ValueKey("not-favorite"),
                                        Icons.favorite_border,
                                        size: 18,
                                        color: ColorManager.red,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: -20,
                      child: DetailsSection(item: item),
                    ),
                  ],
                ),
              ),
              verticalSpacing(11),
              AddToCartSection(),
            ],
          ),
        );
      },
    );
  }
}
