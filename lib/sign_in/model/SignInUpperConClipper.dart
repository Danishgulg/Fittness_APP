import 'dart:ui';

import 'package:flutter/material.dart';

class SignInContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final screenWidth = size.width;
    final screenHeight = size.height;
    final screenMinHeight = screenHeight * 0.2;

    return Path()
      ..cubicTo(0, screenHeight * 0.05, screenWidth * 0.05, screenHeight * 0.2,
          screenWidth * 0.1, screenMinHeight)
      ..lineTo(screenWidth * 0.8, screenMinHeight)
      ..cubicTo(screenWidth * 0.95, screenHeight * 0.2, screenWidth * 0.96,
          screenHeight * 0.2, screenWidth, screenHeight * 0.4)
      ..lineTo(screenWidth, screenHeight)
      ..lineTo(0, screenHeight)
      ..lineTo(0, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
