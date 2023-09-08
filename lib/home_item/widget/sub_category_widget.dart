import 'package:fit_now/home_exercise_module/exercises/abs/view/choose_level_page.dart';
import 'package:fit_now/home_exercise_module/exercises/arm/view/arm_choose_level_page.dart';
import 'package:fit_now/home_exercise_module/exercises/chest/view/chest_choose_level_page.dart';
import 'package:fit_now/home_exercise_module/exercises/leg/view/leg_choose_level_page.dart';
import 'package:fit_now/home_exercise_module/exercises/shoulder_back/view/shoulder_choose_level_page.dart';
import 'package:flutter/material.dart';

class SubCategoryListWidget extends StatelessWidget {
  const SubCategoryListWidget({super.key});

  //create a list by using provider

 

  @override
  Widget build(BuildContext context) {

     final List<SubCategoryContainerWidget> list =  [
    SubCategoryContainerWidget(
        image: const AssetImage("assets/images/running.jpg"), description: 'Running', event: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AbsChooseLevelPage(),));
        },),
    SubCategoryContainerWidget(
        image: const AssetImage("assets/images/running.jpg"), description: 'Running', event: () {
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ArmChooseLevelPage(),));
        },),
    SubCategoryContainerWidget(
        image: const AssetImage("assets/images/running.jpg"), description: 'Running', event: () {
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LegChooseLevelPage(),));
        },),
    SubCategoryContainerWidget(
        image: const AssetImage("assets/images/running.jpg"), description: 'Running', event: () {
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChestChooseLevelPage(),));
        },),
    SubCategoryContainerWidget(
        image: const AssetImage("assets/images/running.jpg"), description: 'Running', event: () {
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ShoulderChooseLevelPage(),));
        },),
  ];

    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return GestureDetector(
      child: Container(
        width: screenWidth * 0.9,
        height: screenHeight * 0.4,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 4, 35, 61),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.05, top: screenHeight * 0.02),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: screenWidth * 0.4,
                mainAxisSpacing: screenHeight * 0.03,
                crossAxisSpacing: screenWidth * 0.06),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return list[index];
            },
          ),
        ),
      ),
    );
  }
}

class SubCategoryContainerWidget extends StatelessWidget {
  const SubCategoryContainerWidget(
      {super.key,
      required this.image,
      required this.description,
      required this.event});

  final ImageProvider image;
  final String description;
  final void Function() event;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final screenArea = (screenHeight + screenWidth) / 2;

    return Center(
      child: GestureDetector(
        onTap: event,
        child: SizedBox(
          width: screenWidth * 0.9,
          height: screenHeight * 0.3,
          child: Stack(
            children: [
              Container(
                width: screenWidth * 0.35,
                height: screenHeight * 0.2,
                decoration: BoxDecoration(
                    image: DecorationImage(image: image, fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(20)),
              ),
              ClipPath(
                clipper: SubCategoryCustomClipper(),
                child: Container(
                    width: screenWidth * 0.35,
                    height: screenHeight * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black.withOpacity(0.4),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.1, bottom: screenHeight * 0.02),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: screenWidth * 0.3,
                          child: Text(
                            description,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenArea * 0.025),
                          ),
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SubCategoryCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final screenWidth = size.width;
    final screenMinHeight = size.height * 0.7;
    final screenHeight = size.height;

    return Path()
      ..lineTo(0, screenMinHeight)
      ..quadraticBezierTo(
          screenWidth * 0.5, screenHeight * 0.45, screenWidth, screenMinHeight)
      ..lineTo(screenWidth, screenHeight)
      ..lineTo(0, screenHeight)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
