import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({super.key, this.title = "title"});
  final String title;
  @override
  Widget build(BuildContext context) {
     final screenSize = MediaQuery.of(context).size;
      final screenHeight = screenSize.height;
       final screenWidth = screenSize.width;
     final screenArea = (screenHeight + screenWidth) / 2;

    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(fontSize: screenArea * 0.045, color: Colors.white),
    );
  }
}
