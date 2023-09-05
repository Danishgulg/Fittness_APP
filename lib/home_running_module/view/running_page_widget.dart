import 'package:fit_now/home_running_module/widget/running_mode.dart';
import 'package:fit_now/home_running_module/widget/step_picker.dart';
import 'package:fit_now/requirments/widget/main_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RunningPage extends StatefulWidget {
  const RunningPage({super.key});

  @override
  State<RunningPage> createState() => _RunningPageState();
}

class _RunningPageState extends State<RunningPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 30, 60),
      body: Stack(children: [
        Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.05,
            top: screenHeight * 0.1,
          ),
          child: const MainTitle(text: 'Select the mode :'),
        ),
        Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.18),
          child: RunningMode()
        ),
        BottomContainerTargetStep()
      ]),
    );
  }
}

class BottomContainerTargetStep extends StatelessWidget {
  const BottomContainerTargetStep({super.key});

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;


    return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipPath(
              clipper: BottomContainerClipper(),
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.7,
                color: Colors.blue.shade900.withOpacity(0.4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const MainTitle(
                      text: 'Target Step',
                    ),
                    StepPicker(
                      selectedWeight: 12,
                      listOfMonth: const [
                        '100',
                        '500',
                        '1000',
                        '1500',
                        '2000',
                        '2500',
                        '3000',
                        '3500',
                        '4000',
                        '4500',
                        '5000',
                        '5500',
                        '6000',
                        '6500',
                        '7000',
                        '7500',
                        '8000',
                        '8500',
                        '9000',
                        '9500',
                        '10000'
                      ],
                      onWeightChanged: (value) {},
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    SizedBox(
                      width: screenWidth * 0.5,
                      child: MaterialButton(
                        onPressed: () {},
                        color: Colors.blue,
                        elevation: 10,
                        splashColor: Colors.blue.shade900,
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: const Text('Set'),
                        
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                  ],
                ),
              ),
            )
          ],
        );
  }
}


class BottomContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final screenWidth = size.width;
    final screenMinHeight = size.height * 0.7;
    final screenHeight = size.height;

    return Path()
      ..lineTo(0, screenMinHeight)
      ..quadraticBezierTo(
          screenWidth * 0.5, screenHeight * 0.45, screenWidth, screenMinHeight)
      ..lineTo(screenWidth, screenHeight)
      ..lineTo(0, screenHeight)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}

