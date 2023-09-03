import 'package:fit_now/record_item/model/bar_chart_measurements/steps/steps_data.dart';
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

    //this will be the number of steps that a person runs in a day

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
      child: BarChart(
          //bar chart data
          BarChartData(
              backgroundColor: Colors.white12,

              // here the max value depand upon the number of step counts
              // stepcount.ceil().toDouble()

              maxY: 100,
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.white24),
              ),
              groupsSpace: 23,

              //specifies the data in the grid

              gridData: FlGridData(
                  drawHorizontalLine: true,
                  horizontalInterval: 34,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) {

                    // here match the steptarget achieved 

                    if (value == 34.0) {
                      
                      return const FlLine(
                        color: Colors.red,
                        dashArray: [5, 10],
                        strokeWidth: 1,
                      );

                    } else {
                      print(value);
                      return const FlLine(
                        color: Colors.grey, // Default horizontal line color
                        strokeWidth: 0.5,
                      );
                    }
                  }),
              barGroups: stepData.individualBarList
                  .map((data) => BarChartGroupData(x: data.x, barRods: [
                        BarChartRodData(
                            toY: data.y,
                            color: const Color.fromARGB(255, 4, 35, 61),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)),
                            width: screenWidth * 0.05)
                      ])
                      
                      )
                  .toList(),
                
                
                  
                  
      )));
  }
}
