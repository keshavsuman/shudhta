part of shudhta;

class Categories {
  String id;
  String name;
  String imageUrl;
  List<SubCategories> subCategories;

  Categories(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.subCategories});

  factory Categories.fromJson(Map<String, dynamic> json) {
    List<SubCategories> subCategories = [];
    if (json['subCategories'] != null) {
      subCategories = (json['subCategories'] as List)
          .map((e) => SubCategories.fromJson(e))
          .toList();
    }
    return Categories(
        id: json['_id'],
        name: json['name'],
        imageUrl: json['image_url'],
        subCategories: subCategories);
  }

  static Future<List<Categories>> getCategories() async {
    final Map<String, dynamic> response =
        await Client.post(APIRoutes.getCategories);
    if (response['status'] == 200) {
      return (response['data'] as List)
          .map((e) => Categories.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  static Future<List<Categories>> getAllCategories() async {
    final Map<String, dynamic> response =
        await Client.post(APIRoutes.getAllCategories);
    if (response['status'] == 200) {
      return (response['data'] as List)
          .map((e) => Categories.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }
}

class SubCategories {
  String name;
  String imageUrl;
  // List<SubSubCategories> sub_sub_categories;

  SubCategories({
    required this.name,
    required this.imageUrl,
  });

  factory SubCategories.fromJson(Map<String, dynamic> json) {
    return SubCategories(name: json['name'], imageUrl: json['image_url']);
  }
}
