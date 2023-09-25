import 'package:fit_now/home_exercise_module/bloc/home_exercise_bloc.dart';
import 'package:fit_now/home_exercise_module/exercises/abs/widget/AbsPageHeader.dart';
import 'package:fit_now/home_exercise_module/exercises/abs/widget/exercise_container.dart';
import 'package:fit_now/home_exercise_module/exercises/abs/widget/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';



class AbsExercisePage extends StatefulWidget {
  const AbsExercisePage({super.key});

  static const String pageName = 'AbsExercisePage';

  @override
  State<AbsExercisePage> createState() => _AbsExercisePageState();
}

class _AbsExercisePageState extends State<AbsExercisePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 30, 60),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              pinned: true,
              delegate: AbsSliverCustomPresistantHeaderDeligate()),
          SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.05, top: screenHeight * 0.05),
            child: Text(
              'Exercises :',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: GoogleFonts.aDLaMDisplay().fontFamily,
                  fontSize: screenWidth * 0.07),
            ),
          )),
          SliverList.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              return BlocBuilder<HomeExerciseBloc, HomeExerciseState>(
                builder: (context, state) {
                  if (state is ExerciseLoadingState) {
                    return Padding(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      child: const ShimmerExerciseGifContainer(),
                    );
                  } else if (state is ExerciseLoadedState) {
                    if(state.list.isNotEmpty){
                    print(state);
                    return Padding(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      child: ExerciseGifContainer(
                        
                        exerciseRequirments: state.list[index],
                        
                      ),
                    );
                  }}
                  else{
                    print('does not have state');
                  }
                  return const ShimmerExerciseGifContainer();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

// Padding(
//     padding: EdgeInsets.all(screenWidth * 0.02),
//     child: ExerciseGifContainer(
//       exerciseRequirments: ExerciseRequirments(
//           titleOfExercise: "fdsfs",
//           numberOfTimes: 'fsdfsdf',
//           addressOfGif: 'assets/images/abs_beginner.png'),
//     )),

