part of shudhta;

class BeautyParlourService {
  String id;
  String name;
  String? description;
  double price;
  String? imageURL;

  BeautyParlourService({
    required this.id,
    required this.name,
    required this.price,
    this.imageURL,
    this.description,
  });

  factory BeautyParlourService.fromJson(Map<String, dynamic> json) {
    return BeautyParlourService(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      imageURL: json['image_url'],
    );
  }

  static Future<List<BeautyParlourService>> fetchDiagnosticsCenter() async {
    final Map<String, dynamic> response =
        await Client.post(APIRoutes.getNearByBeautyParlours, body: {});
    if (response['status'] == 'success') {
      return (response['data'] as List)
          .map((e) => BeautyParlourService.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load Diagnostics');
    }
  }
}
