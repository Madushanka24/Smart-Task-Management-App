import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalyticsScreen extends StatelessWidget {

  final int completedTasks;
  final int pendingTasks;

  AnalyticsScreen({
    required this.completedTasks,
    required this.pendingTasks,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Productivity Analytics"),
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: completedTasks.toDouble(),
                  title: "Completed",
                ),
                PieChartSectionData(
                  value: pendingTasks.toDouble(),
                  title: "Pending",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}