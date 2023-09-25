import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
   final screenSize = MediaQuery.of(context).size;
       final screenWidth = screenSize.width;

    return Text(
      text,
      style: GoogleFonts.aDLaMDisplay().copyWith(
                  fontSize: screenWidth * 0.065,
                  color: Colors.white),
    );
  }
}
