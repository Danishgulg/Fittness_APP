import 'package:fit_now/home_exercise_module/model/exercise_requirment.dart';
import 'package:fit_now/home_item/widget/description_text_widget.dart';
import 'package:fit_now/home_item/widget/main_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseGifContainer extends StatefulWidget {
  const ExerciseGifContainer({
    super.key,
    required this.exerciseRequirments,
  });

  final ExerciseRequirments exerciseRequirments;

  @override
  State<ExerciseGifContainer> createState() => _ExerciseGifContainerState();
}

class _ExerciseGifContainerState extends State<ExerciseGifContainer>
    with SingleTickerProviderStateMixin {
  late Size screenSize;

  late double screenHeight;

  late double screenWidth;

  @override
  void didChangeDependencies() {
    getSizePara();
    super.didChangeDependencies();
  }

  void getSizePara() {
    if (mounted) {
      screenSize = MediaQuery.of(context).size;
      screenHeight = screenSize.height;
      screenWidth = screenSize.width;
    }
  }

  @override
  Widget build(BuildContext context) {
    //  final screenArea = (screenHeight + screenWidth) / 2;

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {
          // Calculate new position based on scroll offset
        }
        return false;
      },
      child: GestureDetector(
        child: Container(
          height: screenHeight * 0.1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 28, 69, 102)),
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.exerciseRequirments.MainTitle,
                        softWrap: true,
                        style: GoogleFonts.aDLaMDisplay().copyWith(
                            color: Colors.white, fontSize: screenWidth * 0.05),
                      ),
                      DescriptionText(
                        text: widget.exerciseRequirments.times,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.04),
                  child: SizedBox(
                    width: screenWidth * 0.25,
                    height: screenHeight * 0.12,
                    child: Image.asset(
                      'assets/images/cycling.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          // show the bottom sheet which represent information about the exercise
          showBottomSheet(
            enableDrag: true,
            constraints: const BoxConstraints(
              maxWidth: double.infinity,
              minWidth: double.infinity,
            ),
            context: context,
            builder: (context) {
              return SizedBox(
                height: screenHeight * 0.9,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: double.infinity,
                      height: screenHeight * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber),
                    ),
                    Container(
                      width: double.infinity,
                      height: screenHeight * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amberAccent),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
