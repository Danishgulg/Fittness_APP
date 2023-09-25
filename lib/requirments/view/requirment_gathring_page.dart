import 'package:fit_now/requirments/bloc/height_bloc.dart/bloc/height_bloc.dart';
import 'package:fit_now/requirments/bloc/weight_bloc/weight_bloc.dart';
import 'package:fit_now/requirments/widget/gender_selection.dart';
import 'package:fit_now/requirments/widget/main_button.dart';
import 'package:fit_now/requirments/widget/main_title.dart';
import 'package:fit_now/requirments/widget/picker_widget.dart';
import 'package:fit_now/requirments/widget/profile_description_text.dart';
import 'package:fit_now/requirments/widget/selection_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RequirmentGathringPage extends StatefulWidget {
  const RequirmentGathringPage({super.key});
  static const String pageName = 'RequirmentGathring';

  @override
  State<RequirmentGathringPage> createState() => _RequirmentGathringPageState();
}

class _RequirmentGathringPageState extends State<RequirmentGathringPage> {
  Color? genderolor = Colors.black;

  int weight = 44;
  String weightType = 'kg';
  int pointWeightValue = 3;

  //main page color
  //  const Color.fromARGB(255, 4, 30, 60),

  //TextField color
  // Colors.blue.shade900.withOpacity(0.4)

  //dialog color
  // const Color.fromARGB(255, 4, 35, 61)

  //item container color
  // Color.fromARGB(255, 34, 63, 108)

  //button color
  // Color.fromARGB(255, 73, 133, 182)

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return ProviderScope(
      child: Scaffold(
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
                      Consumer(builder: (context, ref, child) {
                        GenderType genderType =
                            ref.watch(genderSelectedProvider);

                        return GenderSelectionButton(
                          backgroundColor: genderType == GenderType.male
                              ? Colors.blue
                              : Colors.grey,
                          personImage: const Image(
                              image: AssetImage('assets/images/male.png')),
                          event: () {
                            ref
                                .read(genderSelectedProvider.notifier)
                                .selectMale();
                          },
                        );
                      }),
                      SizedBox(
                        width: screenWidth * 0.1,
                      ),
                      Consumer(builder: (context, ref, child) {
                        GenderType genderType =
                            ref.watch(genderSelectedProvider);

                        return GenderSelectionButton(
                          backgroundColor: genderType == GenderType.female
                              ? Colors.pink
                              : Colors.grey,
                          personImage: const Image(
                              image: AssetImage('assets/images/female.png')),
                          event: () {
                            ref
                                .read(genderSelectedProvider.notifier)
                                .selectFemale();
                          },
                        );
                      })
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
                Center(child: BlocBuilder<WeightBloc, WeightState>(
                    builder: (context, state) {
                  if (state is WeightValuedState) {
                    return SelectionBox(
                      calculation:
                          'weight : ${state.weightModel.weight}.${state.weightModel.weightPointValue} ${state.weightModel.typeOfWeight}',
                      picker: WeightPicker(
                          selectedTypeWeight:
                              state.weightModel.typeOfWeight == 'kg' ? 0 : 1,
                          selectedWeight: state.weightModel.weight,
                          selectedWeightPointValue:
                              state.weightModel.weightPointValue),
                          
                    );
                  } else {
                    return SelectionBox(
                      calculation: 'weight : 32.3 kg',
                      picker: WeightPicker(
                          selectedTypeWeight: 1,
                          selectedWeight: 23,
                          selectedWeightPointValue: 3),
                         
                    );
                  }
                })),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.05),
                    child: const MainTitle(text: 'Select Height')),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Center(child: BlocBuilder<HeightBloc, HeightState>(
                  builder: (context, state) {
                    if (state is HeightValuedState) {
                      return HeightSelectionBox(
                        calculation:
                            'height : ${state.heightModel.height}.${state.heightModel.heightPointVlue} ${state.heightModel.heightType}',
                        picker: HeightPicker(
                           
                            
                            selectedTypeHeight:  state.heightModel.heightType == 'cm' ? 0 : 1,
                            selectedHeight: state.heightModel.height,
                            selectedHeightPointValue: state.heightModel.heightPointVlue),
                         
                      );
                    } else {
                      return HeightSelectionBox(
                        calculation: 'height : 5.10 ft+in',
                        picker: HeightPicker(
                         
                            selectedTypeHeight: 5,
                            selectedHeight: 10,
                            selectedHeightPointValue: 1),
                       
                      );
                    }
                  },
                )),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                const Center(child: MainButton())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
