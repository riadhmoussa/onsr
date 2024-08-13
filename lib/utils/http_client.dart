import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpClient {
  final String baseUrl;

  HttpClient({required this.baseUrl});

  Future<Map<String, dynamic>> getData(String type, String year) async {
    final String url = '$baseUrl?type=$type$year';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Decode response body using utf8.decode
      String responseString = utf8.decode(response.bodyBytes);

      // Parse JSON
      Map<String, dynamic> jsonData = jsonDecode(responseString);

      return jsonData;
    } else {
      print("Error Status Code: ${response.statusCode}");
      print("Error Body: ${response.body}");
      throw Exception('Failed to load data');
    }
  }

  Future<List> getTrafficCenters() async {
    final response = await http.get(Uri.parse("http://192.168.1.102:3000/api/traffic-centers"));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load traffic centers');
    }
  }
}
