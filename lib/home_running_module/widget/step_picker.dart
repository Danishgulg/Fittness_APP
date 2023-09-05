import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StepPicker extends StatelessWidget {
  final int selectedWeight;
  final List<String> listOfMonth;
  final ValueChanged<int> onWeightChanged;

  StepPicker({
    required this.selectedWeight,
    required this.listOfMonth,
    required this.onWeightChanged,
  });
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: screenWidth * 0.8,
          height: screenHeight * 0.1,
          child: RotatedBox(
            quarterTurns: 3,
            child: CupertinoPicker(
              itemExtent: 100.0,
              diameterRatio: 1,
              scrollController:
                  FixedExtentScrollController(initialItem: selectedWeight),
              onSelectedItemChanged: onWeightChanged,
              children: List<Widget>.generate(listOfMonth.length, (index) {
                return RotatedBox(
                  quarterTurns: 1,
                  child: Center(
                    child: Text(
                      listOfMonth[index],
                      style:
                          const TextStyle(fontSize: 24.0, color: Colors.white),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
