import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DailySalesChart extends StatelessWidget {
  const DailySalesChart({super.key});

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
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: LineChart(
                LineChartData(
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
                          const months = ['Apr', 'Jun', 'Aug', 'Oct', 'Dec'];
                          return Text(months[value.toInt() % months.length],
                              style: const TextStyle(color: Colors.white, fontSize: 10));
                        },
                      ),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      spots: [
                        const FlSpot(0, 0),
                        const FlSpot(1, 100),
                        const FlSpot(2, 200),
                        const FlSpot(3, 150),
                        const FlSpot(4, 300),
                        const FlSpot(5, 250),
                        const FlSpot(6, 400),
                      ],
                      barWidth: 3,
                      color: Colors.white,
                      dotData: FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text("Daily Sales", style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("(+15%) increase in today sales."),
            const SizedBox(height: 4),
            const Text("⏰ updated 4 min ago",
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}