import 'package:flutter/material.dart';

class SubCategoryListWidget extends StatelessWidget {
  const SubCategoryListWidget({super.key});

  //create a list by using provider

  final List<SubCategoryContainerWidget> list = const [
    SubCategoryContainerWidget(
        image: AssetImage("assets/images/running.jpg"), description: 'Running'),
    SubCategoryContainerWidget(
        image: AssetImage("assets/images/running.jpg"), description: 'Running'),
    SubCategoryContainerWidget(
        image: AssetImage("assets/images/running.jpg"), description: 'Running'),
    SubCategoryContainerWidget(
        image: AssetImage("assets/images/running.jpg"), description: 'Running'),
    SubCategoryContainerWidget(
        image: AssetImage("assets/images/running.jpg"), description: 'Running'),
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.4,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 4, 35, 61),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding:
            EdgeInsets.only(left: screenWidth * 0.05, top: screenHeight * 0.02),
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
    );
  }
}

class SubCategoryContainerWidget extends StatelessWidget {
  const SubCategoryContainerWidget(
      {super.key, required this.image, required this.description});

  final ImageProvider image;
  final String description;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Center(
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
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  )),
            )
          ],
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
