
import 'package:flutter/material.dart';

class DivContainer extends StatelessWidget {
  const DivContainer({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Container(
      color: Colors.white,
      height: height,
      width: screenWidth * 0.002,
    );
  }
}
