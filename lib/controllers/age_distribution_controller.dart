import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AgeDistributionController extends GetxController {
  var ageData = <AgeData>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAgeData();
  }

  Future<void> fetchAgeData() async {
    try {
      final response = await http.get(Uri.parse('https://onsr.nat.tn/onsr/dataxml/xmltojsonfile.php?type=chauffeursage2023'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List<dynamic> items = jsonData['item'];
        ageData.value = items.map((item) => AgeData.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

class AgeData {
  final String label;
  final String count;

  AgeData({required this.label, required this.count});

  factory AgeData.fromJson(Map<String, dynamic> json) {
    return AgeData(
      label: json['label'],
      count: json['count'],
    );
  }
}
