import 'package:fit_now/home_exercise_module/Widget/exercise_level_container.dart';
import 'package:fit_now/home_item/widget/main_title_widget.dart';
import 'package:flutter/material.dart';

class ShoulderChooseLevelPage extends StatefulWidget {
  const ShoulderChooseLevelPage({super.key});

  static const String pageName = 'ShoulderChooseLevelPage';

  @override
  State<ShoulderChooseLevelPage> createState() => _ShoulderChooseLevelPageState();
}

class _ShoulderChooseLevelPageState extends State<ShoulderChooseLevelPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    //  final screenWidth = screenSize.width;
    //  final screenArea = (screenHeight + screenWidth) / 2;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 30, 60),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: screenHeight * 0.05,
            ),
            const MainTitle(
              title: 'Beginner level',
            ),
            ExerciseLevelContainer(
              decorationImage: const AssetImage('assets/images/abs_beginner.png'),
              level: 1,
              event: () {},
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            const MainTitle(
              title: 'Intermediate level',
            ),
             ExerciseLevelContainer(
              decorationImage: const AssetImage('assets/images/abs_advanced.png'),
              level: 2,
              event: (){},
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            const MainTitle(
              title: 'Advance level',
            ),
             ExerciseLevelContainer(
              decorationImage: const AssetImage('assets/images/abs_intermidiate.png'),
              level: 3,
              event: () {},
            ),
          ]),
        ),
      ),
    );
  }
}

