import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
   final screenSize = MediaQuery.of(context).size;
      final screenHeight = screenSize.height;
       final screenWidth = screenSize.width;
     final screenArea = (screenHeight + screenWidth) / 2;

    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.white,
          fontSize:screenArea * 0.04,
          fontWeight: FontWeight.w700),
    );
  }
}