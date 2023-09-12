//the widget which is used to select the the gender

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenderSelectionButton extends StatelessWidget {
  const GenderSelectionButton(
      {super.key, required this.personImage, required this.backgroundColor, required this.event});

  final Image personImage;
  final Color backgroundColor;
  final  void Function() event;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return GestureDetector(
      onTap: event,
      child: Stack(children: [
        Container(
          width: screenWidth * 0.3,
          height: screenHeight * 0.3,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.045,
            top: screenHeight * 0.01,
          ),
          child: SizedBox(
              width: screenWidth * 0.2,
              height: screenHeight * 0.15,
              child: personImage),
        ),
      ]),
    );
  }
}

// provider for gender selection

final genderSelectedProvider = StateNotifierProvider<GenderSelection, GenderType>((ref) {
  return GenderSelection();
});


class GenderSelection extends StateNotifier<GenderType>{
  GenderSelection():super(GenderType.male);

  void selectFemale(){
    state = GenderType.female;
  }
  void selectMale(){
    state = GenderType.male;
  }
}

enum GenderType{
  male,
  female
}