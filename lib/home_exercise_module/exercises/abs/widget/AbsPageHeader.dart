import 'package:fit_now/home_exercise_module/exercises/abs/view/abs_choose_level_page.dart';
import 'package:fit_now/requirments/widget/main_title.dart';
import 'package:flutter/material.dart';


class AbsSliverCustomPresistantHeaderDeligate
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
            child: const ColoredBox(
              color: Color.fromARGB(255, 34, 63, 108),
            ),
          ),
          Hero(
            tag: AbsChooseLevelPage.beginnerTag,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 150),
              opacity: 1 - progress,
              child: Image.asset(
                'assets/images/abs_beginner.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 24, left: 16),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainTitle(text: 'Beginner',),

                Icon(
                  Icons.bolt,
                  color: Colors.blue,
                  size: 30,
                )
              ],
            )),

            
            
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 254;

  @override
  // TODO: implement minExtent
  double get minExtent => 84;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
