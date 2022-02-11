part of ecommerce;

class AdvertisementModel {
  String id;
  List<String> banners;

  AdvertisementModel({
    required this.id,
    required this.banners,
  });

  factory AdvertisementModel.fromJson(Map<String, dynamic> json) {
    return AdvertisementModel(
      id: json['_id'],
      banners: List<String>.from(json['banners'].map((x) => x)),
    );
  }
}
