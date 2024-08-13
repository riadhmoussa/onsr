import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:onsr/utils/http_client.dart';

import '../controllers/map_controller.dart';
import '../utils/data_service.dart';

class TrafficCenterScreen extends StatelessWidget {
  final MapController controller = Get.put(MapController(
    dataService: DataService(
      httpClient: HttpClient(baseUrl: 'https://onsr.nat.tn/onsr/dataxml/xmltojsonfile.php'),
    ),
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مراكز حرس المرور في سوسة'),
        backgroundColor: Colors.black,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final markers = controller.trafficCenters.map((center) {
          return Marker(
            markerId: MarkerId(center.name),
            position: LatLng(center.lat, center.lng),
            infoWindow: InfoWindow(
              title: center.name,
              snippet: '${center.lat}, ${center.lng}',
            ),
          );
        }).toSet();

        return GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(controller.trafficCenters.isNotEmpty
                ? controller.trafficCenters[0].lat
                : 35.8256, // Default coordinates
                controller.trafficCenters.isNotEmpty
                    ? controller.trafficCenters[0].lng
                    : 10.6344),
            zoom: 14,
          ),
          markers: markers,
        );
      }),
    );
  }
}
