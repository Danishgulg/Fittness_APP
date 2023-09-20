import 'dart:ui';

import 'package:flutter/material.dart';

class SignUpContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final screenWidth = size.width;
    final screenHeight = size.height;
    final screenMaxHeight = screenHeight * 0.8;

    return Path()
      ..moveTo(0, screenHeight)
      ..cubicTo(0, screenHeight * 0.95, screenWidth * 0.05, screenHeight * 0.8,
          screenWidth * 0.1, screenMaxHeight)
      ..lineTo(screenWidth * 0.9, screenMaxHeight)
      ..cubicTo(screenWidth, screenMaxHeight * 0.95, screenWidth,
          screenMaxHeight * 0.85, screenWidth, screenMaxHeight * 0.8)
      ..lineTo(screenWidth, 0)
      ..lineTo(0, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}