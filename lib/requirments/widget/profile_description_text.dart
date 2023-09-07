//the widget that represent the description about the profile

import 'package:flutter/material.dart';

class ProfileDescriptionText extends StatelessWidget {
  const ProfileDescriptionText({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
      final screenHeight = screenSize.height;
       final screenWidth = screenSize.width;
     final screenArea = (screenHeight + screenWidth) / 2;
    return SizedBox(
      width: screenWidth * 0.95,
      child: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.05, right: screenWidth * 0.05),
        child: Text(
          '''please provide accurate information to ensure the accuracy of step count. rest assured, your information remains confidential as we prioritize privacy and do not disclose it to any external parties or organizations.''',
          softWrap: true,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white,
                fontSize: screenArea * 0.03
              ),
        ),
      ),
    );
  }
}
