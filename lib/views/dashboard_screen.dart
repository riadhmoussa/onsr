import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsr/controllers/dashboard_controller.dart';
import 'package:onsr/routes/app_routes.dart';

import '../models/option_model.dart';

class DashboardView extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المرصد الوطني لسلامة المرور'),
        backgroundColor: Colors.black,
      ),
      body: GetBuilder<DashboardController>(
        builder: (controller) {
          return GridView.builder(
            padding: const EdgeInsets.all(16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
              childAspectRatio: 1.2,
            ),
            itemCount: controller.options.length,
            itemBuilder: (context, index) {
              final option = controller.options[index];
              return _buildOptionCard(option, index);
            },
          );
        },
      ),
    );
  }

  Widget _buildOptionCard(OptionModel option, int index) {
    return GestureDetector(
      onTap: () {
        if (index == 4) {
          FirebaseAuth auth = FirebaseAuth.instance;
          User? user = auth.currentUser;
          if (user == null) {
            Get.toNamed(AppRoutes.login);
          } else {
            Get.toNamed(option.route);
          }
        } else {
          Get.toNamed(option.route);
        }
      },
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Stack(
          children: [
            // Background color
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: const Color(0xFFff0000),
                ),
              ),
            ),
            // Title and Icon
            Positioned(
              top: 20.0,
              left: 20.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.insert_chart,
                      size: 40.0, color: Colors.black),
                  const SizedBox(height: 10.0),
                  Text(
                    option.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Animated details (optional, currently not doing anything)
            Positioned(
              bottom: 20.0,
              right: 20.0,
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: controller.animationController,
                    curve: Interval(
                      (0.5 / controller.options.length) * index,
                      1.0,
                      curve: Curves.easeOut,
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  size: 24.0,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
