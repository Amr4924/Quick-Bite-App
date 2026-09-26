import 'package:quick_bite/features/home/data/product_model.dart';

class ProductState {
  List<ProductModel> produts;
  List<ProductModel> cart;
  double totalPrice;
  ProductState({
    required this.produts,
    required this.totalPrice,
    required this.cart,
  });
}
