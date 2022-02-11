part of ecommerce;

class ProductModel {
  String id;
  String name;
  String description;
  List<String> image;
  double price;
  double discountedPrice;

  ProductModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.image,
      required this.price,
      required this.discountedPrice});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'].cast<String>(),
      price: json['price'],
      discountedPrice: json['discounted_price'],
    );
  }
}
