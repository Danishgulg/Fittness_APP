
import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({super.key, this.text = 'description'});
  final String text;

  @override
  Widget build(BuildContext context) {
     final screenSize = MediaQuery.of(context).size;
      final screenHeight = screenSize.height;
       final screenWidth = screenSize.width;
     final screenArea = (screenHeight + screenWidth) / 2;

    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(fontSize: screenArea * 0.033, color: Colors.white),
    );
  }
}
