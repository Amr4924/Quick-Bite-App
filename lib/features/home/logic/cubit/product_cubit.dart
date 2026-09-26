import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_bite/features/home/data/product_model.dart';
import 'package:quick_bite/features/home/logic/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit()
    : super(
        ProductState(
          produts: [
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
              description: 'Crispy golden-fried onion rings served with melted cheddar dip.',
              category: 'Sides',
              price: 4.49,
              rate: 4.7,
              img: 'https://images.unsplash.com/photo-1541592106381-b31e9677c0e5?q=80&w=800&auto=format&fit=crop',
            ),
            ProductModel(
              id: '4',
              nameProduct: 'Chocolate Milkshake',
              description: 'Rich and creamy chocolate milkshake topped with whipped cream.',
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
          ],
          cart: [],
          totalPrice: 0.0,
        ),
      );

  void toggleStateFavorite(ProductModel item) {
    item.isFavorite = !item.isFavorite;

    final products = List<ProductModel>.from(state.produts);
    final itemIndex = products.indexWhere((product) => product.id == item.id);

    if (itemIndex == -1) {
      products.add(item);
    } else {
      products[itemIndex] = item;
    }

    emit(
      ProductState(
        produts: products,
        totalPrice: state.totalPrice,
        cart: state.cart,
      ),
    );
  }
}
