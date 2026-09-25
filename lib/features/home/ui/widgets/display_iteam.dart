import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/helpers/spasing.dart';
import 'package:quick_bite/core/routing/router.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/core/theming/style.dart';
import 'package:quick_bite/features/home/data/product_model.dart';

class DisplayIteam extends StatefulWidget {
  const DisplayIteam({super.key});

  @override
  State<DisplayIteam> createState() => _DisplayIteamState();
}

class _DisplayIteamState extends State<DisplayIteam> {
  List<ProductModel> products = [
    ProductModel(
      id: '1',
      nameProduct: 'Double Beef Bacon Burger',
      description: 'Juicy double beef patty with crispy bacon, cheddar cheese, and signature BBQ sauce.',
      category: 'Burgers',
      price: 11.99,
      rate: 4.8,
      img: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=800&auto=format&fit=crop',
    ),
    ProductModel(
      id: '2',
      nameProduct: 'Mushroom Swiss Burger',
      description: 'Fresh beef patty topped with sautéed mushrooms, Swiss cheese, and garlic mayo.',
      category: 'Burgers',
      price: 10.49,
      rate: 4.8,
      img: 'https://images.unsplash.com/photo-1586190848861-99aa4a171e90?q=80&w=800&auto=format&fit=crop',
    ),
    ProductModel(
      id: '3',
      nameProduct: 'Cheesy Onion Rings',
      description:
          'Crispy golden-fried onion rings served with melted cheddar dip.',
      category: 'Sides',
      price: 4.49,
      rate: 4.7,
      img: 'https://images.unsplash.com/photo-1541592106381-b31e9677c0e5?q=80&w=800&auto=format&fit=crop',
    ),
    ProductModel(
      id: '4',
      nameProduct: 'Chocolate Milkshake',
      description:
          'Rich and creamy chocolate milkshake topped with whipped cream.',
      category: 'Drinks',
      price: 3.99,
      rate: 4.5,
      img: 'https://images.unsplash.com/photo-1572490122747-3968b75cc699?q=80&w=800&auto=format&fit=crop',
    ),
    ProductModel(
      id: '5',
      nameProduct: 'Warm Lava Cake',
      description: 'Delicious chocolate cake with a molten chocolate center served fresh.',
      category: 'Desserts',
      price: 5.29,
      rate: 4.0,
      img: 'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?q=80&w=800&auto=format&fit=crop',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, i) {
        ProductModel iteam = products[i];
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.productDetails,
                arguments: iteam,
              );
            },
            child: Hero(
              tag: iteam.id,
              child: Container(
                width: double.infinity.w,
                height: 105.h,
                decoration: BoxDecoration(
                  color: ColorManager.whiteBackgroundColor,
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14.r),
                      child: Image.network(
                        iteam.img,
                        fit: BoxFit.cover,
                        width: 76.w,
                        height: 76.h,
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
                              iteam.nameProduct,
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
                                  "${iteam.rate}   ${iteam.category}",
                                  style: TextStyles.font12WarmGrayRegular,
                                ),
                              ],
                            ),
                            verticalSpacing(8.5),
                            Text(
                              "\$${iteam.price}",
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
            ),
          ),
        );
      },
    );
  }
}
