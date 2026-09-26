import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_bite/core/widgets/card_product.dart';
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
              child: CardProduct(item: item),
            );
          },
        );
      },
    );
  }
}
