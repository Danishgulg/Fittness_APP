import 'package:fit_now/measurement_charts/charts_widget/bar_chart/bar_chart_widget.dart';
import 'package:flutter/material.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  final List<double> weeklySummaryList = [
    23.4,
    54.32,
    14.32,
    51.32,
    23.32,
    64.32,
    99.32,
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 30, 60),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: screenHeight * 0.4,
                width: screenWidth,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color.fromARGB(255, 78, 117, 176)),
                child: BarChartWidget(
                  weeklySummaryList: weeklySummaryList,
                ))
          ],
        ),
      ),
    );
  }
}
