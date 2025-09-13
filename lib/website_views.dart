import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WebsiteViewsChart extends StatelessWidget {
  const WebsiteViewsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(12),
              ),
              child: BarChart(
                BarChartData(
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                          return Text(days[value.toInt() % days.length],
                              style: const TextStyle(color: Colors.white));
                        },
                      ),
                    ),
                  ),
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 50, color: Colors.white)]),
                    BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 20, color: Colors.white)]),
                    BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 30, color: Colors.white)]),
                    BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 15, color: Colors.white)]),
                    BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 45, color: Colors.white)]),
                    BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 60, color: Colors.white)]),
                    BarChartGroupData(x: 6, barRods: [BarChartRodData(toY: 40, color: Colors.white)]),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text("Website Views", style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("Last Campaign Performance"),
            const SizedBox(height: 4),
            const Text("📅 campaign sent 2 days ago",
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}