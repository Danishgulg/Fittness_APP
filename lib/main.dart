import 'dart:ui';

import 'package:fit_now/requirment_gathring_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

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
                const _FirstScreenSignUpButton(),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                const _FirstScreenSignInButton(),
                 SizedBox(
                  height: screenHeight * 0.02,
                ),
                const _AsGuestButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//the button that navigates to the signUp screen

class _FirstScreenSignUpButton extends StatelessWidget {
  const _FirstScreenSignUpButton({super.key});
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

class _FirstScreenSignInButton extends StatelessWidget {
  const _FirstScreenSignInButton({super.key});
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

class _AsGuestButton extends StatelessWidget {
  const _AsGuestButton({super.key});

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
