import 'package:get/get.dart';
import '../models/statistic_model.dart';
import '../utils/data_service.dart';
import '../utils/http_client.dart';  // Import HttpClient

class ResultStatController extends GetxController {
  late final String selectedYear;
  late final String selectedOption;
  var statisticModelList = <StatisticModel>[].obs;
  var isLoading = true.obs;

  final DataService dataService = DataService(httpClient: HttpClient(baseUrl: 'https://onsr.nat.tn/onsr/dataxml/xmltojsonfile.php'));

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    selectedYear = arguments['year'];
    selectedOption = arguments['option'];
    print("selectedYear");
    print(selectedYear);
    print("selectedOption");
    print(selectedOption);
    fetchData();
  }

  void fetchData() async {
    try {
      isLoading.value = true;
      final result = await dataService.fetchData(selectedOption, selectedYear);
      statisticModelList.value = (result['item'] as List)
          .map((item) => StatisticModel.fromJson(item))
          .toList();
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
