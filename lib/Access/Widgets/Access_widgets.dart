import 'package:fit_now/requirments/view/requirment_gathring_page.dart';
import 'package:flutter/material.dart';


//the button that navigates to the signUp screen

class FirstScreenSignUpButton extends StatelessWidget {
  const FirstScreenSignUpButton({super.key});
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return InkWell(
      child: Container(
        width: screenWidth * 0.6,
        height: screenHeight * 0.08,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blue.shade200,
              Colors.blue.shade300,
              Colors.blue.shade500
            ]),
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(30)),
        child: const Center(
            child: Text(
          'Sign Up',
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}


//the button that navigates to the SignIn screen

class FirstScreenSignInButton extends StatelessWidget {
  const FirstScreenSignInButton({super.key});
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return GestureDetector(
      child: Container(
        width: screenWidth * 0.6,
        height: screenHeight * 0.08,
        decoration: BoxDecoration(
            color: Colors.black45,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(30)),
        child: const Center(
          child: Text(
            'Sign in',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class AsGuestButton extends StatelessWidget {
  const AsGuestButton({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return GestureDetector(
      child: SizedBox(
        width: screenWidth * 0.4,
        child: Center(
          child: Text(
            'as a Guest',
            style: TextStyle(color: Colors.blue.shade300, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => RequirmentGathring(),));
      },
    );
  }
}
