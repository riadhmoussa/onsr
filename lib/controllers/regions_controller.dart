import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:async';

import 'package:onsr/models/region.dart';

class RegionsController extends GetxController {
  var url = "".obs;
  var progress = 0.0.obs;

  Future<void> showRegionDialog(Region region) async {
    print("Hello World ");

    Get.defaultDialog(
      title: region.name,
      content: SizedBox(
        width: double.infinity,
        height: 400,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var emergencyContacts in region.contacts)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      emergencyContacts.type,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 10),
                    for (var entry in emergencyContacts.numbers.entries)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              entry.key, // Location
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              entry.value, // Phone number(s)
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    SizedBox(height: 20),
                  ],
                ),
            ],
          ),
        ),
      ),
      confirm: ElevatedButton(
        onPressed: () => Get.back(),
        child: Text('OK'),
      ),
      barrierDismissible: true,
    );
  }
}
