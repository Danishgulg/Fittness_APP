import 'package:fit_now/step_tracking_running_module/widget/div_container.dart';
import 'package:flutter/material.dart';

class StartRunningButton extends StatelessWidget {
  const StartRunningButton({super.key, required this.isCount});
  final bool isCount;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final screenArea = (screenHeight + screenWidth) / 2;

    return SizedBox(
      width: screenWidth * 0.5,
      height: screenHeight * 0.07,
      child: MaterialButton(
        onPressed: () {
          // getStepCount();
        },
        color: !isCount
            ? const Color.fromARGB(255, 73, 133, 182)
            : Colors.grey.shade300,
        elevation: 10,
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Align(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_right_rounded,
                size: screenHeight * 0.07,
                color: Colors.white,
              ),
              DivContainer(height: screenHeight * 0.05),
              SizedBox(
                width: screenWidth * 0.04,
              ),
              Text(
                'Start',
                style:
                    TextStyle(color: Colors.white, fontSize: screenArea * 0.04),
              )
            ],
          ),
        ),
      ),
    );
  }
}
