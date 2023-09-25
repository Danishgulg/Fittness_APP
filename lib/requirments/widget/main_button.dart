//button used to nevigate to the main home page

import 'package:fit_now/main_screen/main_screen_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  static const String mainCollection = 'HomeExercise';
  static const String absDoc = 'AbsExercise';
  static const String level = 'beginner';
  const MainButton({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final screenArea = (screenHeight + screenWidth) / 2;

    return SizedBox(
      width: screenWidth * 0.9,
      child: CupertinoButton(
          color: Colors.blue,
          onPressed: () {
            Navigator.pushNamed(context, MainScreenPage.pageName);
          },
          child: Text(
            "NEXT",
            style: TextStyle(fontSize: screenArea * 0.03),
          )),
    );
  }
}
