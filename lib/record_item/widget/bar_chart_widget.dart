import 'package:fit_now/measurement_charts/charts_data/steps/steps_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartWidget extends StatelessWidget {
  final List weeklySummaryList;
  const BarChartWidget({super.key, required this.weeklySummaryList});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    WeeklyStepData stepData = WeeklyStepData(
        SunStep: weeklySummaryList[0],
        MonStep: weeklySummaryList[1],
        TueStep: weeklySummaryList[2],
        WedStep: weeklySummaryList[3],
        ThuStep: weeklySummaryList[4],
        FriStep: weeklySummaryList[5],
        SatStep: weeklySummaryList[6]);

    stepData.getBarListData();

    return Padding(
      padding:
          EdgeInsets.only(top: screenHeight * 0.1, left: screenWidth * 0.05),
      child: BarChart(BarChartData(
          backgroundColor: Colors.white12,
          maxY: 100,
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.white24),
          ),
          groupsSpace: 23,
          gridData: FlGridData(
            drawHorizontalLine: false,
            horizontalInterval: 34,
            drawVerticalLine: false,
            getDrawingVerticalLine: (value) => FlLine(color: Colors.black38),
          ),
          barGroups: stepData.individualBarList
              .map((data) => BarChartGroupData(x: data.x, barRods: [
                    BarChartRodData(
                        toY: data.y,
                        color: Colors.blue,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
                        width: screenWidth * 0.05)
                  ]))
              .toList())),
    );
  }
}
