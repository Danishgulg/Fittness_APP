//the widget which is used to select the the gender

import 'package:flutter/material.dart';

class GenderSelectionButton extends StatelessWidget {
  const GenderSelectionButton(
      {super.key, required this.personImage, required this.backgroundColor});

  final Image personImage;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return GestureDetector(
      child: Stack(children: [
        Container(
          width: screenWidth * 0.3,
          height: screenHeight * 0.3,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.045,
            top: screenHeight * 0.01,
          ),
          child: SizedBox(
              width: screenWidth * 0.2,
              height: screenHeight * 0.15,
              child: personImage),
        ),
      ]),
      onTap: () {
        //change the color of the backgroundContainer by adding in the Color state using bloc
      },
    );
  }
}

