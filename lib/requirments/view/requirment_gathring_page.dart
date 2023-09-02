import 'dart:ui';

import 'package:fit_now/main_screen/main_screen_page.dart';
import 'package:flutter/cupertino.dart';
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
                    const MaleGenderSelectionButton(
                        backgroundColor: Colors.blue,
                        personImage:
                            Image(image: AssetImage('assets/images/male.png'))),
                    SizedBox(
                      width: screenWidth * 0.1,
                    ),
                    const MaleGenderSelectionButton(
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

class MainTitle extends StatelessWidget {
  const MainTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;

    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Colors.white,
          fontSize: screenHeight * 0.03,
          fontWeight: FontWeight.w700),
    );
  }
}

//button used to nevigate to the main home page

class MainButton extends StatelessWidget {
  const MainButton({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return SizedBox(
      width: screenWidth * 0.9,
      child: CupertinoButton(
          color: Colors.blue,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreenPage(),
                ));
          },
          child: const Text("NEXT")),
    );
  }
}

//the widget that represent the description about the profile

class ProfileDescriptionText extends StatelessWidget {
  const ProfileDescriptionText({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return SizedBox(
      width: screenWidth * 0.95,
      child: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.05, right: screenWidth * 0.05),
        child: Text(
          '''please provide accurate information to ensure the accuracy of step count. rest assured, your information remains confidential as we prioritize privacy and do not disclose it to any external parties or organizations.''',
          softWrap: true,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}

//the widget which is used to select the the gender

class MaleGenderSelectionButton extends StatelessWidget {
  const MaleGenderSelectionButton(
      {super.key, required this.personImage, required this.backgroundColor});

  final Image personImage;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return GestureDetector(
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
      onTap: () {
        //change the color of the backgroundContainer by adding in the Color state using bloc
      },
    );
  }
}

//the widget that represnts the box with text to show the
// weight or height and on its ontap dialog opens

class SelectionBox extends StatefulWidget {
  const SelectionBox(
      {super.key, required this.calculation, required this.picker});

  final String calculation;
  final Widget picker;

  @override
  State<SelectionBox> createState() => _SelectionBoxState();
}

class _SelectionBoxState extends State<SelectionBox> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return GestureDetector(
      child: Container(
        width: screenWidth * 0.9,
        height: screenHeight * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.blue.shade900.withOpacity(0.4),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.05),
            child: Text(
              widget.calculation,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white, fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.03),
            child: const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
              size: 35,
            ),
          )
        ]),
      ),
      onTap: () {
        showCupertinoDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return BackdropFilter(
              filter: const ColorFilter.linearToSrgbGamma(),
              child: Center(
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.5,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 4, 35, 61),
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(children: [
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    const MainTitle(text: "Weight"),
                    Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.05),
                        child: Text(
                            'weight is required for calories calculation',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [widget.picker],
                    ),
                    SizedBox(
                      height: screenHeight * 0.04,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      GestureDetector(
                        child: Text(
                          'CANCEL',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(
                        width: screenWidth * 0.1,
                      ),
                      GestureDetector(
                        child: Text(
                          'OK',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          //here we can add the values of weight to the event stream
                        },
                      ),
                      SizedBox(
                        width: screenWidth * 0.05,
                      )
                    ]),
                  ]),
                ),
              ),
            );
          },
        );
      },
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

// this is a picker based on the cupertino widget to pick the height

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
