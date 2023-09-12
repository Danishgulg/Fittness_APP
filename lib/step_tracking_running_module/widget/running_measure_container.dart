import 'package:flutter/material.dart';

class RunningMeasureContainer extends StatelessWidget {
  const RunningMeasureContainer(
      {super.key, required this.image, required this.text});

  final Image image;
  final String text;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final screenArea = (screenHeight + screenWidth) / 2;

    return Container(
      width: screenWidth * 0.22,
      height: screenHeight * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 4, 35, 61),
      ),
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.1,
            width: screenWidth * 0.2,
            child: image,
          ),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: screenArea * 0.03),
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.grey.shade200, fontSize: screenArea * 0.025),
          )
        ],
      ),
    );
  }
}
