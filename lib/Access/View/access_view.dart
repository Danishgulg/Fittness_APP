import 'package:fit_now/Access/Widgets/Access_widgets.dart';
import 'package:flutter/material.dart';

class AccessPage extends StatelessWidget {
  const AccessPage({super.key});

  static const String pageName = 'AccessPage';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/BeforeLoginPic.png'),
                fit: BoxFit.fill),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const FirstScreenSignUpButton(),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                const FirstScreenSignInButton(),
                 SizedBox(
                  height: screenHeight * 0.02,
                ),
                const AsGuestButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}