import 'package:fit_now/sign_in/model/SignInUpperConClipper.dart';
import 'package:fit_now/sign_in/widget/sign_in_button.dart';
import 'package:fit_now/sign_in/widget/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  static const pageName = 'SignInPage';
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

// main page color
//  const Color.fromARGB(255, 4, 30, 60),

//TextField color
// Colors.blue.shade900.withOpacity(0.4)

//dialog color
// const Color.fromARGB(255, 4, 35, 61)

//button color
//Color.fromARGB(255, 73, 133, 182)

class _SignInPageState extends State<SignInPage> {
  final _signInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      resizeToAvoidBottomInset:false,
      backgroundColor: const Color.fromARGB(255, 4, 30, 60),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: screenHeight * 0.05),
          Text('SignIn',
              style: GoogleFonts.aDLaMDisplay().copyWith(
                  fontSize: screenWidth * 0.1,
                  color: const Color.fromARGB(255, 73, 133, 182))),
          SizedBox(height: screenHeight * 0.05),
          SignInForm(signInFormKey: _signInFormKey),
          SignInButton(event: () {
            _signInFormKey.currentState?.validate();
          }),
          SizedBox(height: screenHeight * 0.08),
          ClipPath(
            clipper: SignInContainerClipper(),
            child: Container(
              width: double.infinity,
              height: screenHeight * 0.4,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/sign_in_image.gif'))),
            ),
          )
        ],
      ),
    );
  }
}
