import 'package:get/get.dart';
import 'package:onsr/utils/data_service.dart';
import '../models/traffic_center_model.dart';

class MapController extends GetxController {
  var trafficCenters = <TrafficCenter>[].obs;
  var isLoading = true.obs;

  final DataService dataService;

  MapController({required this.dataService});

  @override
  void onInit() {
    super.onInit();
    fetchTrafficCenters();
  }

  void fetchTrafficCenters() async {
    try {
      isLoading.value = true;
      final response = await dataService.getTrafficCenters();
      trafficCenters.value = (response as List)
          .map((item) => TrafficCenter.fromJson(item))
          .toList();
    } catch (e) {
      print('Error fetching traffic centers: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
