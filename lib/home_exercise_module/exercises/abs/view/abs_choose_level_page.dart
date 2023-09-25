import 'package:fit_now/home_exercise_module/Widget/exercise_level_container.dart';
import 'package:fit_now/home_exercise_module/bloc/home_exercise_bloc.dart';
import 'package:fit_now/home_exercise_module/exercises/abs/view/abs_exercise_page.dart';
import 'package:fit_now/home_item/widget/main_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AbsChooseLevelPage extends StatefulWidget {
  const AbsChooseLevelPage({super.key});

  static const String pageName = 'AbsChooseLevelPage';
  static const String beginnerTag = 'beginner';
  static const String intermediateTag = 'intermediate';
  static const String advanveTag = 'advance';

  @override
  State<AbsChooseLevelPage> createState() => _AbsChooseLevelPageState();
}

class _AbsChooseLevelPageState extends State<AbsChooseLevelPage> {
  //ussed to determined the address of data on firebase project
  static const String exerciseTypeName = 'AbsExercise';
  static const String exerciseLevel = 'beginner';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    //  final screenWidth = screenSize.width;
    //  final screenArea = (screenHeight + screenWidth) / 2;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 30, 60),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: screenHeight * 0.05,
            ),
            const MainTitle(
              title: 'Beginner level',
            ),
            Hero(
              tag: AbsChooseLevelPage.beginnerTag,
              child: ExerciseLevelContainer(
                decorationImage:
                    const AssetImage('assets/images/abs_beginner.png'),
                level: 1,
                event: () {
                  context.read<HomeExerciseBloc>().add(const AbsExerciseEvent(
                      exerciseTypeName: exerciseTypeName,
                      levelOfexercise: exerciseLevel));
                  Navigator.of(context).pushNamed(AbsExercisePage.pageName);
                },
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            const MainTitle(
              title: 'Intermediate level',
            ),
            ExerciseLevelContainer(
              decorationImage:
                  const AssetImage('assets/images/abs_advanced.png'),
              level: 2,
              event: () {},
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            const MainTitle(
              title: 'Advance level',
            ),
            ExerciseLevelContainer(
              decorationImage:
                  const AssetImage('assets/images/abs_intermidiate.png'),
              level: 3,
              event: () {},
            ),
          ]),
        ),
      ),
    );
  }
}
