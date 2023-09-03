
import 'package:fit_now/requirments/widget/gender_selection.dart';
import 'package:fit_now/requirments/widget/main_button.dart';
import 'package:fit_now/requirments/widget/main_title.dart';
import 'package:fit_now/requirments/widget/picker_widget.dart';
import 'package:fit_now/requirments/widget/profile_description_text.dart';
import 'package:fit_now/requirments/widget/selection_box.dart';
import 'package:flutter/material.dart';

class RequirmentGathring extends StatefulWidget {
  const RequirmentGathring({super.key});

  @override
  State<RequirmentGathring> createState() => _RequirmentGathringState();
}

class _RequirmentGathringState extends State<RequirmentGathring> {
  Color? color = Colors.black;

  // main page color
  //  const Color.fromARGB(255, 4, 30, 60),

  //TextField color
  // Colors.blue.shade900.withOpacity(0.4)

  //dialog color
  // const Color.fromARGB(255, 4, 35, 61)

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: const Color.fromARGB(255, 4, 30, 60),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: kToolbarHeight * 0.7,
              ),
              Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.05),
                  child: const MainTitle(
                    text: 'My Profile',
                  )),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              const ProfileDescriptionText(),
              Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.05),
                  child: const MainTitle(
                    text: 'Select Gender',
                  )),
              SizedBox(
                height: screenHeight * 0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GenderSelectionButton(
                        backgroundColor: Colors.blue,
                        personImage:
                            Image(image: AssetImage('assets/images/male.png'))),
                    SizedBox(
                      width: screenWidth * 0.1,
                    ),
                    const GenderSelectionButton(
                        backgroundColor: Colors.blue,
                        personImage: Image(
                            image: AssetImage('assets/images/female.png'))),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.05),
                  child: const MainTitle(text: 'Select Weight')),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Center(
                  child: SelectionBox(
                calculation: '23.2',
                picker: WeightPicker(
                    onWeightPointChanged: (value) {},
                    onWeightTypeChanged: (value) {},
                    onWeightChanged: (value) {},
                    selectedTypeWeight: 34,
                    selectedWeight: 44,
                    selectedWeightPointValue: 9),
              )),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.05),
                  child: const MainTitle(text: 'Select Height')),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Center(
                  child: SelectionBox(
                calculation: '23.2',
                picker: HeightPicker(
                    onHeightPointChanged: (value) {},
                    onHeightTypeChanged: (value) {},
                    onHeightChanged: (value) {},
                    selectedTypeHeight: 34,
                    selectedHeight: 44,
                    selectedHeightPointValue: 9),
              )),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              const Center(child: MainButton())
            ],
          ),
        ),
      ),
    );
  }
}






