
import 'package:flutter/material.dart';

class ExerciseLevelContainer extends StatelessWidget {
  const ExerciseLevelContainer(
      {super.key,
      required this.decorationImage,
      required,
      required this.level, required this.event });
  final ImageProvider decorationImage;
  final int level;
  final void Function() event;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return GestureDetector(
      onTap:event,
      child: Container(
        alignment: Alignment.bottomLeft,
        width: screenWidth * 0.9,
        height: screenHeight * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: decorationImage, fit: BoxFit.fill),
        ),
        child: Row(children: [
          for (int i = 1; i <= level; i++)
            const Icon(
              Icons.bolt,
              color: Colors.blue,
            )
        ]),
      )
    );
  }
}

