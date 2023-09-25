import 'dart:math';

import 'package:fit_now/step_tracking_running_module/model/step_progress_painter.dart';
import 'package:fit_now/step_tracking_running_module/widget/div_container.dart';
import 'package:fit_now/step_tracking_running_module/widget/running_measure_container.dart';
import 'package:fit_now/step_tracking_running_module/widget/start_running_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pedometer/pedometer.dart';

class StepTrackingPage extends StatefulWidget {
  const StepTrackingPage({super.key});
  static const String pageName = 'StepTrackingPage';

  @override
  State<StepTrackingPage> createState() => _StepTrackingPageState();
}

class _StepTrackingPageState extends State<StepTrackingPage> {
  String steps = '10000';
  int stepss = 1022;
  int target = 10000;
  bool isCount = false;

  @override
  void initState() {
    super.initState();
    // getStepCount();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 30, 60),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.1,
            ),
            Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.7,
              decoration: BoxDecoration(
                  color: Colors.blue.shade900.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Text('Steps Counter',
                      style: GoogleFonts.aDLaMDisplay().copyWith(
                          fontSize: screenWidth * 0.06,
                          color:Colors.white)),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  SizedBox(
                    width: screenWidth * 0.5,
                    height: screenHeight * 0.25,
                    child: Stack(
                      children: [
                        CustomPaint(
                          // define the number of steps measured and the step target

                          painter: StepProgressPainter(
                              progress: 200, stepTarget: 1500),
                          child: Container(
                              width: screenWidth * 0.5,
                              height: screenHeight * 0.3),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            steps,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.09),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.08),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'steps',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.04),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RunningMeasureContainer(
                        image: Image.asset(
                          'assets/images/run_calories.png',
                          fit: BoxFit.fill,
                        ),
                        type: 'cal burnt',
                        amount: '233',
                      ),
                      DivContainer(
                        height: screenHeight * 0.1,
                      ),
                      RunningMeasureContainer(
                        image: Image.asset(
                          'assets/images/run_time.png',
                          fit: BoxFit.fill,
                        ),
                        type: 'Time',
                        amount: '12:43 ',
                      ),
                      DivContainer(
                        height: screenHeight * 0.1,
                      ),
                      RunningMeasureContainer(
                        image: Image.asset(
                          'assets/images/run_distance.png',
                          fit: BoxFit.fill,
                        ),
                        type: 'Distance',
                        amount: '11km',
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.06,
            ),
            StartRunningButton(
              isCount: isCount,
            )
          ],
        ),
      ),
    );
  }

  double _getStepPercent(int value, int target) {
    return (value / target) * 1;
  }
}
