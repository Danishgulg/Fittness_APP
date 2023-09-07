import 'package:fit_now/home_running_module/widget/set_target_button.dart';
import 'package:fit_now/home_running_module/widget/step_picker.dart';
import 'package:fit_now/requirments/widget/main_title.dart';
import 'package:flutter/material.dart';

class BottomContainerTargetStep extends StatelessWidget {
  const BottomContainerTargetStep({super.key});

  final List<String> listOfMonth = const [
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
  ];

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
                  listOfMonth: listOfMonth,
                  onWeightChanged: (value) {},
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                const SetTargetButton(),
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