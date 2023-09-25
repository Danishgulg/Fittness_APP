import 'dart:math';

import 'package:flutter/material.dart';

class StepProgressPainter extends CustomPainter {
  StepProgressPainter({ required this.progress, required this.stepTarget});

  double progress;
  double stepTarget;

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final centerOffset = Offset(width / 2, height / 2);
    final radius = min(width, height) / 2;

    //total number of lines on meter
    const totalLines = 180;

    final Paint paintInline = Paint()
      ..shader = const RadialGradient(colors: [
        Color.fromARGB(255, 143, 215, 85),
        Color.fromARGB(255, 133, 40, 3),
      ], center: Alignment(-1, 0.2), radius: 0.9)
          .createShader(Rect.fromCircle(center: centerOffset, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

    final Paint centerCirculePaint = Paint()
      ..color = const Color.fromARGB(255, 36, 77, 109)
      ..strokeWidth = 10;

    final Paint paintOutline = Paint()
      ..shader = const RadialGradient(colors: [
        Color.fromARGB(255, 62, 62, 240),
        Color.fromARGB(255, 67, 67, 230),
        Color.fromARGB(255, 101, 101, 134),
      ], center: Alignment(0, 1), radius: 0.9)
          .createShader(Rect.fromCircle(center: centerOffset, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 30;

    canvas.drawArc(
        Rect.fromCenter(center: centerOffset, width: width, height: height),
        degToRed(0),
        degToRed(360),
        false,
        paintOutline);

    canvas.drawArc(
        Rect.fromCenter(center: centerOffset, width: width, height: height),
        degToRed(130),
        degToRed(progressCalculation(progress, stepTarget)),
        false,
        paintInline);

    canvas.drawCircle(centerOffset, radius * 0.6, centerCirculePaint);

    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final rad = min(centerX, centerY) - 10; // Adjust for padding

    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 1.0;

    for (int i = 0; i <= totalLines; i++) {
      final angle = -pi * 1.27 +
          (i / totalLines) * pi * 1.48; // Calculate the angle for each line
      final isMajorLine = i % 10 == 0; // Identify major lines

      // Define line start and end points
      final startX = centerX + cos(angle) * rad;
      final startY = centerY + sin(angle) * rad;
      final endX = centerX + cos(angle) * (isMajorLine ? rad - 20 : rad - 10);
      final endY = centerY + sin(angle) * (isMajorLine ? rad - 20 : rad - 10);

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);

      // Optionally, label major lines with values
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  double degToRed(double degree) {
    return degree * (pi / 180);
  }

  double progressCalculation(double stepProgress, double target){
    return (stepProgress/target) * 270;
  }
}
