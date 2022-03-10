part of shudhta;

class Client {
  static const String scheme = 'http';
  static const String host = '192.168.29.196';
  static const int port = 8000;

  static Uri getUri(String path) {
    return Uri(scheme: scheme, host: host, port: port, path: path);
  }

  static Map<String, String> getHeaders() =>
      {'Content-Type': 'application/json', 'Authorization': 'Bearer ${''}'};

  static Future<Map<String, dynamic>> get(String path) async {
    try {
      var response = await http.get(getUri(path), headers: getHeaders());
      // if (response.statusCode == 200) {
      return jsonDecode(response.body);
      // } else {
      //   throw Exception('Failed to load data');
      // }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<Map<String, dynamic>> post(String path,
      {Map<String, dynamic>? body}) async {
    try {
      final http.Response response =
          await http.post(getUri(path), headers: getHeaders());
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
      return {"status": 500};
    }
  }
}
