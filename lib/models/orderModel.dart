part of ecommerce;

class OrderModel {
  String id;
  UserModel user;
  List<ProductModel> products;

  OrderModel({
    required this.id,
    required this.user,
    required this.products,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['_id'],
      user: UserModel.fromJson(json['user']),
      products: List<ProductModel>.from(
          json['Products'].map((x) => ProductModel.fromJson(x))),
    );
  }
}
