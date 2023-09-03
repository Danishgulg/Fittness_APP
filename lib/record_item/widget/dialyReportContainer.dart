import 'dart:async';

import 'package:fit_now/home_item/widget/description_text_widget.dart';
import 'package:fit_now/record_item/widget/line_chart_widget.dart';
import 'package:fit_now/requirments/widget/main_title.dart';
import 'package:flutter/material.dart';

class DialyReportContainer extends StatelessWidget {
  const DialyReportContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    const int stepTarget = 2000;
    const int stepCount = 1000;

    return Container(
        height: screenHeight * 0.5,
        width: screenWidth * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white30),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.05),
              child: MainTitle(
                  // step made value
                  text: stepCount.toString()),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.05),
              child: const DescriptionText(
                  // step Target value
                  text: '/$stepTarget steps'),
            ),
          ),
          StepLinearProgress(),
          Container(
            height: screenHeight * 0.3,
            width: screenWidth * 0.9,
            child: const LineChartWidget(),
          ),
        ]));
  }
}

class StepLinearProgress extends StatefulWidget {
  @override
  _StepLinearProgressState createState() => _StepLinearProgressState();
}

class _StepLinearProgressState extends State<StepLinearProgress> {
  int _progressValue = 0;
  StreamController<int> _progressController = StreamController<int>();

  @override
  void initState() {
    super.initState();

    // Simulate progress updates
    startProgress();
  }

  @override
  void dispose() {
    _progressController.close();
    super.dispose();
  }

  void startProgress() {
    //  progress updates here

    Timer.periodic(Duration(days: 1), (timer) {
      if (_progressValue < 100) {
        setState(() {
          _progressValue += 10; // Increment the progress value
        });

        _progressController.add(_progressValue);
      } else {
        timer.cancel(); // Stop the timer when progress reaches 100%
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        StreamBuilder<int>(
          stream: _progressController.stream,
          initialData: _progressValue,
          builder: (context, snapshot) {
            return SizedBox(
              width: screenWidth * 0.8,
              height: screenHeight * 0.02,
              child: LinearProgressIndicator(
                value:
                    snapshot.data! / 100, // Normalize the value between 0 and 1
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(
                  _progressValue < 50
                      ? Colors.red // Color for low progress
                      : Colors.green, // Color for high progress
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            );
          },
        ),
        SizedBox(height: 20),
        DescriptionText(
          text: 'Progress: $_progressValue%',
        ),
      ],
    );
  }
}
