// this is a picker based on the cupertino widget to pick the height

import 'package:fit_now/requirments/bloc/height_bloc.dart/bloc/height_bloc.dart';
import 'package:fit_now/requirments/bloc/weight_bloc/weight_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeightPicker extends StatelessWidget {
  final int selectedHeight;
  final int selectedTypeHeight;
  final int selectedHeightPointValue;

  HeightPicker({
    required this.selectedHeight,
    required this.selectedTypeHeight,
    required this.selectedHeightPointValue,
  });
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final screenArea = (screenHeight + screenWidth) / 2;

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
            onSelectedItemChanged: (value) {
              context.read<HeightBloc>().add(HeightAddEvent(value));
            },
            children: List<Widget>.generate(9, (index) {
              return Center(
                child: Text(
                  '$index',
                  style: TextStyle(
                      fontSize: screenArea * 0.04, color: Colors.white),
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
            onSelectedItemChanged: (value) {
              context.read<HeightBloc>().add(HeightPointValueAddEvent(value));
            },
            children: List<Widget>.generate(11, (index) {
              return Center(
                child: Text(
                  '$index',
                  style: TextStyle(
                      fontSize: screenArea * 0.04, color: Colors.white),
                ),
              );
            }),
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(
          width: screenWidth * 0.13,
          height: screenHeight * 0.3,
          child: CupertinoPicker(
            itemExtent: 40.0,
            diameterRatio: 1,
            selectionOverlay: Container(
              width: screenWidth * 0.15,
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
            onSelectedItemChanged: (value) {
              context
                  .read<HeightBloc>()
                  .add(HeightTypeAddEvent(value == 0 ? 'cm' : 'ft+in'));
            },
            children: [
              Text(
                'cm',
                style:
                    TextStyle(fontSize: screenArea * 0.04, color: Colors.white),
              ),
              Text(
                'ft+in',
                style:
                    TextStyle(fontSize: screenArea * 0.04, color: Colors.white),
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

  WeightPicker({
    required this.selectedWeight,
    required this.selectedTypeWeight,
    required this.selectedWeightPointValue,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final screenArea = (screenHeight + screenWidth) / 2;

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
            onSelectedItemChanged: (value) {
              context.read<WeightBloc>().add(WeightAddEvent(value));
            },
            children: List<Widget>.generate(663, (index) {
              return Center(
                child: Text(
                  '$index',
                  style: TextStyle(
                      fontSize: screenArea * 0.04, color: Colors.white),
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
            onSelectedItemChanged: (value) {
              context.read<WeightBloc>().add(WeightPointValueAddEvent(value));
            },
            children: List<Widget>.generate(10, (index) {
              return Center(
                child: Text(
                  '$index',
                  style: TextStyle(
                      fontSize: screenArea * 0.04, color: Colors.white),
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
            onSelectedItemChanged: (value) {
              context
                  .read<WeightBloc>()
                  .add(WeightTypeAddEvent(value == 0 ? 'kg' : 'lbs'));
            },
            children: [
              Text(
                'kg',
                style:
                    TextStyle(fontSize: screenArea * 0.04, color: Colors.white),
              ),
              Text(
                'lbs',
                style:
                    TextStyle(fontSize: screenArea * 0.04, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// final weightProvider =
//     StateNotifierProvider.family<WeightMeasure, double, double>((ref, value) {
//   return WeightMeasure(value);
// });

// class WeightMeasure extends StateNotifier<double> {
//   double value;

//   WeightMeasure(this.value) : super(value);

//   double actualWeightValue = 0;
//   String weightType = 'kg';

//   void setWeight(double value) {
//     actualWeightValue = value;
//   }

//   void setWeightPointValue(double value) {
//     actualWeightValue = actualWeightValue + (value * 0.1);
//   }

//   void setWeightType(int index) {
//     if (index == 0) {
//       weightType = 'kg';
//     } else {
//       weightType = 'lbs';
//     }
//   }

//   void setVlues(){
//     state = actualWeightValue;
//   }
// }

