import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartWidget extends StatelessWidget {
  final String title;
  final List<StatisticPoint> points;

  const BarChartWidget({
    Key? key,
    required this.title,
    required this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 300,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: points.map((point) => point.value).reduce((a, b) => a > b ? a : b) + 10,
              barTouchData: BarTouchData(enabled: true),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      return Text(value.toInt().toString());
                    },
                  ),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.black, width: 1),
              ),
              barGroups: points
                  .asMap()
                  .map((index, point) => MapEntry(
                index,
                BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: point.value,
                      color: Colors.blue,
                      width: 4,
                    ),
                  ],
                ),
              ))
                  .values
                  .toList(),
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: points.map((point) {
            return Text(point.label,style: TextStyle(fontSize: 10),);
          }).toList(),
        ),
      ],
    );
  }
}
class StatisticPoint {
  final String label;
  final double value;

  StatisticPoint({required this.label, required this.value});
}

