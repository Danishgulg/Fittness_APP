import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerExerciseGifContainer extends StatelessWidget {
  const ShimmerExerciseGifContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    // final screenWidth = screenSize.width;
    //  final screenArea = (screenHeight + screenWidth) / 2;

    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 28, 69, 102),
      highlightColor: Colors.grey.shade300,
      child: Container(
        height: screenHeight * 0.15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 18, 43, 63)),
      ),
    );
  }
}
