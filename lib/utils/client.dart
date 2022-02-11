part of shudhta;

class Client {
  static const String scheme = 'http';
  static const String host = 'localhost';
  static const int port = 8080;

  static Uri getUri(String path) {
    return Uri(scheme: scheme, host: host, port: port, path: path);
  }

  static Future<Map<String, dynamic>> get(String path) async {
    try {
      var response = await http.get(getUri(path));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
