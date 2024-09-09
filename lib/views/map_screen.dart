import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:onsr/controllers/regions_controller.dart';
import 'package:onsr/data/regions_data.dart';
import 'package:onsr/models/region.dart';

class RegionsScreen extends StatelessWidget {
  final RegionsController _controller = Get.put(RegionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map of Tunisia'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(33.8869, 9.5375), // Center of Tunisia
          zoom: 6.0,
        ),
        markers: _createMarkers(),
        onMapCreated: (GoogleMapController controller) {
          // Handle map creation if needed
        },
        onTap: (LatLng position) {
          // Optionally handle map taps here if needed
        },
      ),
    );
  }

  Set<Marker> _createMarkers() {
    return regions.map((region) {
      return Marker(
        markerId: MarkerId(region.name),
        position: LatLng(region.latitude, region.longitude),
        infoWindow: InfoWindow(
          title: region.name,
          onTap: () {
            // InfoWindow tap is handled here
            _controller.showRegionDialog(region);
          },
        ),
        onTap: () {
          // Handle marker tap directly
          _controller.showRegionDialog(region);
        },
      );
    }).toSet();
  }
}
