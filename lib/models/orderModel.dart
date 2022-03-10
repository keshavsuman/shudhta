part of shudhta;

class Order {
  String id;
  UserModel user;
  List<ProductModel> products;

  Order({
    required this.id,
    required this.user,
    required this.products,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['_id'],
      user: UserModel.fromJson(json['user']),
      products: List<ProductModel>.from(
          json['Products'].map((x) => ProductModel.fromJson(x))),
    );
  }
}
