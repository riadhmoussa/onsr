import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsr/controllers/result_stat_controller.dart';

import '../models/statistic_model.dart';

class ResultStatScreen extends StatelessWidget {
  const ResultStatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ResultStatController controller = Get.put(ResultStatController());

    return Scaffold(
      appBar: AppBar(
        title: Text('شاشة النتائج'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() {
          if (controller.isLoading.value) {
            return CircularProgressIndicator();
          } else if (controller.statisticModelList.isEmpty) {
            return Text('لا توجد بيانات',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
          } else {
            return ListView.builder(
              itemCount: controller.statisticModelList.length,
              itemBuilder: (context, index) {
                final statistic = controller.statisticModelList[index];
                return _buildStatisticCard(statistic);
              },
            );
          }
        }),
      ),
    );
  }

  Widget _buildStatisticCard(StatisticModel statistic) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                statistic.labelle ?? 'غير متوفر',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatisticItem(
                  label: 'حوادث',
                  value: statistic.accidents ?? 'غير متوفر',
                  color: Color(0xFF0000FF),
                  icon: Icons.car_rental,
                ),
                _buildStatisticItem(
                  label: "قتلى",
                  value: statistic.tues ?? 'غير متوفر',
                  color: Color(0xFFFF0000),
                  icon: Icons.dangerous,
                ),
                _buildStatisticItem(
                  label: "جرحى",
                  value: statistic.blesses ?? 'غير متوفر',
                  color: Color(0xFF008000),
                  icon: Icons.favorite,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticItem({
    required String label,
    required String value,
    required Color color,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 28,
          color: color,
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
