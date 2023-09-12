import 'package:fit_now/step_tracking_running_module/widget/div_container.dart';
import 'package:fit_now/step_tracking_running_module/widget/running_measure_container.dart';
import 'package:fit_now/step_tracking_running_module/widget/start_running_button.dart';
import 'package:flutter/material.dart';
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
    final screenArea = (screenHeight + screenWidth) / 2;

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
                  SizedBox(
                    height: screenHeight * 0.1,
                  ),
                  SizedBox(
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.2,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: screenWidth * 0.4,
                          height: screenHeight * 0.2,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.grey.shade400,
                            color: const Color.fromARGB(255, 64, 142, 96),
                            strokeCap: StrokeCap.round,
                            strokeWidth: screenWidth * 0.03,
                            value: _getStepPercent(1, 1000),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Target \n$steps',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenArea * 0.04),
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
                        text: 'cal burnt',
                      ),
                      DivContainer(
                        height: screenHeight * 0.1,
                      ),
                      RunningMeasureContainer(
                        image: Image.asset(
                          'assets/images/run_time.png',
                          fit: BoxFit.fill,
                        ),
                        text: 'cal burnt',
                      ),
                      DivContainer(
                        height: screenHeight * 0.1,
                      ),
                      RunningMeasureContainer(
                        image: Image.asset(
                          'assets/images/run_distance.png',
                          fit: BoxFit.fill,
                        ),
                        text: 'cal burnt',
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.06,
            ),
            StartRunningButton(isCount: isCount,)
          ],
        ),
      ),
    );
  }

  double _getStepPercent(int value, int target) {
    return (value / target) * 1;
  }
}




