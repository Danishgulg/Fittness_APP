import 'package:fit_now/home_item/widget/main_title_widget.dart';
import 'package:flutter/material.dart';

class CategoryContainerWidget extends StatelessWidget {
  const CategoryContainerWidget(
      {super.key,
      required this.image,
      required this.mainText,
      required this.description,
      required this.onTapEvent
      });

  final ImageProvider image;
  final String mainText;
  final String description;
  final void Function() onTapEvent;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
      final screenHeight = screenSize.height;
       final screenWidth = screenSize.width;
     final screenArea = (screenHeight + screenWidth) / 2;

    return Center(
      child: InkWell(
        onTap: onTapEvent,
        child: SizedBox(
          width: screenWidth * 0.9,
          height: screenHeight * 0.3,
          child: Stack(
            children: [
              Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.25,
                decoration: BoxDecoration(
                    image: DecorationImage(image: image, fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(20)),
              ),
              ClipPath(
                clipper: CategoryCustomClipper(),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black.withOpacity(0.4),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.05),
                            child: MainTitle(title: mainText)),
                        Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.05),
                            child: SizedBox(
                              width: screenWidth * 0.3,
                              child: Text(
                                description,
                                style: TextStyle(
                                    color: Colors.white, fontSize: screenArea * 0.025),
                              ),
                            ))
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final screenWidth = size.width;
    final screenHeight = size.height;

    return Path()
      ..lineTo(0, 0)
      ..lineTo(screenWidth * 0.6, 0)
      ..quadraticBezierTo(screenWidth * 0.4, screenHeight * 0.5,
          screenWidth * 0.6, screenHeight)
      ..lineTo(0, screenHeight)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}