import 'package:flutter/material.dart';
import 'package:fit_now/requirments/widget/main_title.dart';


class RunningMode extends StatelessWidget {
  const RunningMode({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return SizedBox(
            width: screenWidth,
            height: screenHeight * 0.6,
            child: PageView(
              children: const [
                RunModeWidget(
                    image: AssetImage('assets/images/walking_mode.png'),
                    modeName: 'Walking'),
                RunModeWidget(
                    image: AssetImage('assets/images/running_mode.png'),
                    modeName: 'Running')
              ],
            ),
          );
  }
}

class RunModeWidget extends StatelessWidget {
  const RunModeWidget({super.key, required this.image, required this.modeName});

  final ImageProvider image;
  final String modeName;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Column(
      children: [
        Container(
          height: screenHeight * 0.5,
          width: screenWidth * 0.7,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(image: DecorationImage(image: image)),
          child: MainTitle(text: modeName),
        ),
      ],
    );
  }
}
