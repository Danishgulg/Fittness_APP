import 'package:fit_now/home_exercise_module/Widget/exercise_level_container.dart';
import 'package:fit_now/home_item/widget/main_title_widget.dart';
import 'package:flutter/material.dart';

class AbsChooseLevelPage extends StatefulWidget {
  const AbsChooseLevelPage({super.key});

  @override
  State<AbsChooseLevelPage> createState() => _AbsChooseLevelPageState();
}

class _AbsChooseLevelPageState extends State<AbsChooseLevelPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    //  final screenWidth = screenSize.width;
    //  final screenArea = (screenHeight + screenWidth) / 2;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 30, 60),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: screenHeight * 0.05,
            ),
            const MainTitle(
              title: 'Beginner level',
            ),
            ExerciseLevelContainer(
              decorationImage:
                  const AssetImage('assets/images/abs_beginner.png'),
              level: 1,
              event: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AbsExercise(),
                ));
              },
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

class AbsExercise extends StatefulWidget {
  const AbsExercise({super.key});

  @override
  State<AbsExercise> createState() => _AbsExerciseState();
}

class _AbsExerciseState extends State<AbsExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 30, 60),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              delegate: SliverCustomPresistantHeaderDeligate())
        ],
      ),
    );
  }
}

class SliverCustomPresistantHeaderDeligate
    extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;

    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: progress,
            child: ColoredBox(
              color:  Colors.blue.shade900.withOpacity(0.4),
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: 1 - progress,
            child: Image.asset(
              'assets/images/abs_beginner.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 264;

  @override
  // TODO: implement minExtent
  double get minExtent => 84;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
