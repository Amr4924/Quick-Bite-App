class ProductModel {
  String nameProduct;
  String description;
  String category;
  String img;
  String id;
  double price;
  double rate;
  int quantity;
  bool isFavorite;
  ProductModel({
    required this.nameProduct,
    required this.description,
    required this.category,
    required this.price,
    required this.id,
    required this.img,
    required this.rate,
    this.isFavorite = false,
    this.quantity = 1,
  });
}
