import 'package:fit_now/home_running_module/widget/bottom_container_target_step.dart';
import 'package:flutter/material.dart';
import 'package:fit_now/home_running_module/widget/running_mode.dart';
import 'package:fit_now/requirments/widget/main_title.dart';

class RunningPage extends StatefulWidget {
  const RunningPage({super.key});

  static const String pageName = 'RunningPage';

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
            child: const RunningMode()),
        const BottomContainerTargetStep()
      ]),
    );
  }
}







