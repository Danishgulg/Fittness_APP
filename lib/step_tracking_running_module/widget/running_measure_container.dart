import 'package:flutter/material.dart';

class RunningMeasureContainer extends StatelessWidget {
  const RunningMeasureContainer(
      {super.key,
      required this.image,
      required this.type,
      required this.amount});

  final Image image;
  final String type;
  final String amount;

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
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 81, 139, 167).withOpacity(0.4),
      ),
      child: Column(
        children: [
          Container(
            height: screenHeight * 0.12,
            width: screenWidth * 0.22,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 34, 63, 108),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: image,
          ),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          Text(
            type,
            style: TextStyle(color: Colors.white, fontSize: screenArea * 0.03),
          ),
          FittedBox(
            child: Text(
              amount,
              style: TextStyle(
                  color: Colors.grey.shade200, fontSize: screenArea * 0.025),
            ),
          )
        ],
      ),
    );
  }
}
