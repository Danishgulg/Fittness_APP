import 'package:fit_now/sign_up/Model/SignupUpperConClipper.dart';
import 'package:fit_now/sign_up/widget/sign_up_button.dart';
import 'package:fit_now/sign_up/widget/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  static const pageName = 'Sign_up';

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isVisible = false;
  final _signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 30, 60),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipPath(
              clipper: SignUpContainerClipper(),
              child: Container(
                height: screenHeight * 0.4,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/sign_up_boxing_gif.gif'),
                        fit: BoxFit.fitHeight)),
              ),
            ),
            Text('SignUp',
                style: GoogleFonts.aDLaMDisplay().copyWith(
                    fontSize: screenWidth * 0.1,
                    color: const Color.fromARGB(255, 73, 133, 182))),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            SignUpForm(signUpFormKey: _signUpFormKey),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            SignUpButton(event: () {
              _signUpFormKey.currentState?.validate();
            }),
            SizedBox(height: screenHeight * 0.03),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: screenWidth * 0.7,
                  height: 1,
                  color: Colors.white,
                ),
                Container(
                    alignment: Alignment.center,
                    width: screenWidth * 0.1,
                    color: const Color.fromARGB(255, 4, 30, 60),
                    child: Text(
                      'OR',
                      style: GoogleFonts.aDLaMDisplay()
                          .copyWith(color: Colors.white),
                    ))
              ],
            ),

            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.05, bottom: screenHeight * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                     SizedBox(
                height: screenHeight * 0.1,
                width: screenWidth * 0.3,
                child: MaterialButton(
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.5)),
                  onPressed: () {},
                  child: Image.asset(
                    'assets/images/google_icon.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
                       SizedBox(
                height: screenHeight * 0.1,
                width: screenWidth * 0.3,
                child: MaterialButton(
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.5)),
                  onPressed: () {},
                  child: Image.asset(
                    'assets/images/facebook_icon.png',
                    fit: BoxFit.fill, 
                  ),
                ),
              ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
