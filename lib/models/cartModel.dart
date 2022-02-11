part of ecommerce;

class CartModel {
  String id;
  int totalItems;
  double price;
  double? total;
  List<CartProductModel> product;

  CartModel({
    required this.id,
    required this.totalItems,
    required this.price,
    required this.product,
    this.total,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      totalItems: json['totalItems'],
      price: json['price'],
      total: json['total'],
      product: List<CartProductModel>.from(
          json['product'].map((x) => CartProductModel.fromJson(x))),
    );
  }

  Future<CartModel> getCart() async {
    final Map<String, dynamic> cart = await Client.get(APIRoutes.getCart);
    return CartModel.fromJson(cart);
  }
}

class CartProductModel {
  String id;
  String name;
  String description;
  List<String> images;
  double price;
  double discountedPrice;

  CartProductModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.images,
      required this.price,
      required this.discountedPrice});

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      images: json['images'].cast<String>(),
      price: json['price'],
      discountedPrice: json['discounted_price'],
    );
  }
}

// Demo Data
final CartModel cartModel =
    CartModel(id: '1', totalItems: 0, price: 0, product: CartProducts);

final List<CartProductModel> CartProducts = [
  CartProductModel(
      id: '1',
      name: '',
      description: '',
      images: [
        'https://www.docformats.com/wp-content/uploads/2018/02/Grocery-List.png'
      ],
      price: 250,
      discountedPrice: 220)
];
