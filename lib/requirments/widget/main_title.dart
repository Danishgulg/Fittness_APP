import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;

    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Colors.white,
          fontSize: screenHeight * 0.03,
          fontWeight: FontWeight.w700),
    );
  }
}