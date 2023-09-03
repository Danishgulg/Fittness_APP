// this is a picker based on the cupertino widget to pick the height

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeightPicker extends StatelessWidget {
  final int selectedHeight;
  final int selectedTypeHeight;
  final int selectedHeightPointValue;
  final ValueChanged<int> onHeightChanged;
  final ValueChanged<int> onHeightTypeChanged;
  final ValueChanged<int> onHeightPointChanged;

  HeightPicker(
      {required this.selectedHeight,
      required this.selectedTypeHeight,
      required this.selectedHeightPointValue,
      required this.onHeightChanged,
      required this.onHeightTypeChanged,
      required this.onHeightPointChanged});
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Row(
      children: [
        SizedBox(
          width: screenWidth * 0.13,
          height: screenHeight * 0.2,
          child: CupertinoPicker(
            itemExtent: 40.0,
            diameterRatio: 1,
            selectionOverlay: Container(
              width: screenWidth * 0.1,
              height: screenHeight * 0.06,
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                        color: Colors.white,
                      ),
                      bottom: BorderSide(color: Colors.white))),
            ),
            looping: true,
            scrollController:
                FixedExtentScrollController(initialItem: selectedHeight),
            onSelectedItemChanged: onHeightChanged,
            children: List<Widget>.generate(9, (index) {
              return Center(
                child: Text(
                  '$index',
                  style: const TextStyle(fontSize: 24.0, color: Colors.white),
                ),
              );
            }),
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(
          width: screenWidth * 0.1,
          height: screenHeight * 0.2,
          child: CupertinoPicker(
            itemExtent: 40.0,
            diameterRatio: 0.9,
            selectionOverlay: Container(
              width: screenWidth * 0.1,
              height: screenHeight * 0.06,
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                        color: Colors.white,
                      ),
                      bottom: BorderSide(color: Colors.white))),
            ),
            looping: true,
            scrollController: FixedExtentScrollController(
                initialItem: selectedHeightPointValue),
            onSelectedItemChanged: onHeightPointChanged,
            children: List<Widget>.generate(11, (index) {
              return Center(
                child: Text(
                  '$index',
                  style: const TextStyle(fontSize: 24.0, color: Colors.white),
                ),
              );
            }),
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(
          width: screenWidth * 0.1,
          height: screenHeight * 0.3,
          child: CupertinoPicker(
            itemExtent: 40.0,
            diameterRatio: 1,
            selectionOverlay: Container(
              width: screenWidth * 0.13,
              height: screenHeight * 0.06,
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                        color: Colors.white,
                      ),
                      bottom: BorderSide(color: Colors.white))),
            ),
            scrollController:
                FixedExtentScrollController(initialItem: selectedTypeHeight),
            onSelectedItemChanged: onHeightTypeChanged,
            children: const [
              Text(
                'cm',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              Text(
                'ft+in',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// this is a picker based on the cupertino widget to pick the weight

class WeightPicker extends StatelessWidget {
  final int selectedWeight;
  final int selectedTypeWeight;
  final int selectedWeightPointValue;
  final ValueChanged<int> onWeightChanged;
  final ValueChanged<int> onWeightTypeChanged;
  final ValueChanged<int> onWeightPointChanged;

  WeightPicker(
      {required this.selectedWeight,
      required this.selectedTypeWeight,
      required this.selectedWeightPointValue,
      required this.onWeightChanged,
      required this.onWeightTypeChanged,
      required this.onWeightPointChanged});
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Row(
      children: [
        SizedBox(
          width: screenWidth * 0.13,
          height: screenHeight * 0.2,
          child: CupertinoPicker(
            itemExtent: 40.0,
            diameterRatio: 1,
            selectionOverlay: Container(
              width: screenWidth * 0.1,
              height: screenHeight * 0.06,
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                        color: Colors.white,
                      ),
                      bottom: BorderSide(color: Colors.white))),
            ),
            looping: true,
            scrollController:
                FixedExtentScrollController(initialItem: selectedWeight),
            onSelectedItemChanged: onWeightChanged,
            children: List<Widget>.generate(663, (index) {
              return Center(
                child: Text(
                  '$index',
                  style: const TextStyle(fontSize: 24.0, color: Colors.white),
                ),
              );
            }),
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(
          width: screenWidth * 0.1,
          height: screenHeight * 0.2,
          child: CupertinoPicker(
            itemExtent: 40.0,
            diameterRatio: 0.9,
            selectionOverlay: Container(
              width: screenWidth * 0.1,
              height: screenHeight * 0.06,
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                        color: Colors.white,
                      ),
                      bottom: BorderSide(color: Colors.white))),
            ),
            looping: true,
            scrollController: FixedExtentScrollController(
                initialItem: selectedWeightPointValue),
            onSelectedItemChanged: onWeightPointChanged,
            children: List<Widget>.generate(10, (index) {
              return Center(
                child: Text(
                  '$index',
                  style: const TextStyle(fontSize: 24.0, color: Colors.white),
                ),
              );
            }),
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(
          width: screenWidth * 0.1,
          height: screenHeight * 0.3,
          child: CupertinoPicker(
            itemExtent: 40.0,
            diameterRatio: 1,
            selectionOverlay: Container(
              width: screenWidth * 0.1,
              height: screenHeight * 0.06,
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                        color: Colors.white,
                      ),
                      bottom: BorderSide(color: Colors.white))),
            ),
            scrollController:
                FixedExtentScrollController(initialItem: selectedTypeWeight),
            onSelectedItemChanged: onWeightTypeChanged,
            children: const [
              Text(
                'kg',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              Text(
                'lbs',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
