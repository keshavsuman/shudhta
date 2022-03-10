part of shudhta;

class Advertisement {
  String id;
  String imageUrl;
  String? title;

  Advertisement({required this.id, required this.imageUrl, this.title});

  factory Advertisement.fromJson(Map<String, dynamic> json) {
    return Advertisement(
      id: json['_id'],
      imageUrl: json['image_url'],
      title: json['name'],
    );
  }

  static Future<List<Advertisement>> getAdvertisements() async {
    final Map<String, dynamic> response =
        await Client.post(APIRoutes.getAdvertisements);
    if (response['status'] == 200) {
      return (response['data'] as List)
          .map((e) => Advertisement.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }
}
