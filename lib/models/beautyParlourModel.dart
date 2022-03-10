part of shudhta;

class BeautyParlour {
  String id;
  String name;
  String address;
  String? contact;
  String? email;
  List<BeautyParlourService>? tests;
  String? imageURL;

  BeautyParlour(
      {required this.id,
      required this.name,
      required this.address,
      this.imageURL,
      this.contact,
      this.tests,
      this.email});

  factory BeautyParlour.fromJson(Map<String, dynamic> json) {
    return BeautyParlour(
        id: json['_id'],
        name: json['name'],
        address: json['address'],
        contact: json['mobile'],
        tests: json['tests']
            ?.map<BeautyParlourService>(
                (test) => BeautyParlourService.fromJson(test))
            ?.toList(),
        email: json['email'],
        imageURL: json['image_url']);
  }

  static Future<List<BeautyParlour>> fetchDiagnosticsCenter() async {
    final Map<String, dynamic> response =
        await Client.post(APIRoutes.getNearByBeautyParlours, body: {});
    if (response['status'] == 200) {
      return (response['data'] as List)
          .map((e) => BeautyParlour.fromJson(e))
          .toList();
    } else {
      print(response);
      throw Exception('Failed to load Diagnostics centers');
    }
  }

  Future<List<BeautyParlourService>> fetchDiagnosticTests() async {
    final Map<String, dynamic> response =
        await Client.post(APIRoutes.getBeautyParlourServices(id), body: {});
    if (response['status'] == 200) {
      this.tests = (response['data'] as List)
          .map((e) => BeautyParlourService.fromJson(e))
          .toList();
      return this.tests!;
    } else {
      throw Exception('Failed to load Diagnostics tests');
    }
  }
}
