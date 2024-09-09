import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../controllers/age_distribution_controller.dart';

class AgeDistributionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AgeDistributionController controller = Get.put(AgeDistributionController());

    return Scaffold(
      appBar: AppBar(
        title: Text('age_deaths_distribution'.tr),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.ageData.isEmpty) {
          return Center(child: Text('No data available'));
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: RotatedBox(
            quarterTurns: 3, // Rotate the chart to make it horizontal
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: controller.ageData.map((e) => int.parse(e.count)).reduce((a, b) => a > b ? a : b).toDouble() + 10,
                barGroups: controller.ageData.asMap().entries.map((entry) {
                  final index = entry.key;
                  final data = entry.value;
                  final count = int.parse(data.count);
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: count.toDouble(),
                        color: Colors.yellow, // Color for the bars
                        width: 20,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  );
                }).toList(),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 80,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        return SideTitleWidget(
                          axisSide: AxisSide.left, // Changed from bottom to left
                          child: Text(
                            controller.ageData[index].label,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 50,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          axisSide: AxisSide.bottom, // Changed from left to bottom
                          child: Text(
                            value.toString(),
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: false),

              ),
            ),
          ),
        );
      }),
    );
  }
}
