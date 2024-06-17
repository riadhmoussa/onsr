import 'http_client.dart';

class DataService {
  final HttpClient httpClient;

  DataService({required this.httpClient});

  Future<Map<String, dynamic>> fetchData(String type, String year) {
    return httpClient.getData(type, year);
  }
}
