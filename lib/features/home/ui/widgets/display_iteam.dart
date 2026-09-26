import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/helpers/spasing.dart';
import 'package:quick_bite/core/routing/router.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/core/theming/style.dart';
import 'package:quick_bite/features/home/data/product_model.dart';
import 'package:quick_bite/features/home/logic/cubit/product_cubit.dart';
import 'package:quick_bite/features/home/logic/cubit/product_state.dart';

class Displayitem extends StatelessWidget {
  const Displayitem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.produts.length,
          itemBuilder: (context, i) {
            ProductModel item = state.produts[i];
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                width: double.infinity.w,
                height: 105.h,
                decoration: BoxDecoration(
                  color: ColorManager.whiteBackgroundColor,
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.productDetails,
                          arguments: item,
                        );
                      },
                      child: Hero(
                        tag: item.id,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14.r),
                          child: Image.network(
                            item.img,
                            fit: BoxFit.cover,
                            width: 76.w,
                            height: 76.h,
                          ),
                        ),
                      ),
                    ),
                    horizontalSpacing(12),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.nameProduct,
                              style: TextStyles.font15BlackSemiBold,
                            ),
                            verticalSpacing(6),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  size: 12,
                                  color: ColorManager.secondry,
                                ),
                                horizontalSpacing(4),
                                Text(
                                  "${item.rate}   ${item.category}",
                                  style: TextStyles.font12WarmGrayRegular,
                                ),
                              ],
                            ),
                            verticalSpacing(8.5),
                            Text(
                              "\$${item.price}",
                              style: TextStyles.font15OrangeBold,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: 28.w,
                            height: 28.h,
                            decoration: BoxDecoration(
                              color: ColorManager.primaryColor,
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Icon(
                              Icons.add,
                              color: ColorManager.whiteBackgroundColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
