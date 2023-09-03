//button used to nevigate to the main home page

import 'package:fit_now/main_screen/main_screen_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return SizedBox(
      width: screenWidth * 0.9,
      child: CupertinoButton(
          color: Colors.blue,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreenPage(),
                ));
          },
          child: const Text("NEXT")),
    );
  }
}