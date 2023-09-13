//the widget that represnts the box with text to show the
// weight or height and on its ontap dialog opens

import 'package:fit_now/requirments/bloc/height_bloc.dart/bloc/height_bloc.dart';
import 'package:fit_now/requirments/bloc/weight_bloc/weight_bloc.dart';
import 'package:fit_now/requirments/widget/main_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class SelectionBox extends StatefulWidget {
  const SelectionBox(
      {super.key, required this.calculation, required this.picker,});

  final String calculation;
  final Widget picker;

  @override
  State<SelectionBox> createState() => _SelectionBoxState();
}

class _SelectionBoxState extends State<SelectionBox> {
  @override
  Widget build(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
      final screenHeight = screenSize.height;
       final screenWidth = screenSize.width;
     final screenArea = (screenHeight + screenWidth) / 2;

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
                      height: screenHeight * 0.02,
                    ),
                    const MainTitle(text: "Weight"),
                    Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.05),
                        child: Text(
                            'weight is required for calories calculation',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white, fontSize:  screenArea * 0.03))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [widget.picker],
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      GestureDetector(
                        child: Text(
                          'CANCEL',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                fontSize: screenArea * 0.04,
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
                        onTap: () {
                            context
                              .read<WeightBloc>()
                              .add(OkWeightEvent());
                              Navigator.of(context).pop();
                        },
                        child: Text(
                          'OK',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                fontSize: screenArea * 0.04,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                        ),
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




class HeightSelectionBox extends StatefulWidget {
  const HeightSelectionBox(
      {super.key, required this.calculation, required this.picker,});

  final String calculation;
  final Widget picker;

  @override
  State<HeightSelectionBox> createState() => _HeightSelectionBoxState();
}

class _HeightSelectionBoxState extends State<HeightSelectionBox> {
  @override
  Widget build(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
      final screenHeight = screenSize.height;
       final screenWidth = screenSize.width;
     final screenArea = (screenHeight + screenWidth) / 2;

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
                      height: screenHeight * 0.02,
                    ),
                    const MainTitle(text: "Height"),
                    Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.05),
                        child: Text(
                            'Height is required for calories calculation',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white, fontSize:  screenArea * 0.03))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [widget.picker],
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      GestureDetector(
                        child: Text(
                          'CANCEL',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                fontSize: screenArea * 0.04,
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
                        onTap: () {
                            context
                              .read<HeightBloc>()
                              .add(OKHeightEvent());
                              Navigator.of(context).pop();
                        },
                        child: Text(
                          'OK',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                fontSize: screenArea * 0.04,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                        ),
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


