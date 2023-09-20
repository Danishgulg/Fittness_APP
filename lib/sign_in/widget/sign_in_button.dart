import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key, required this.event});

  final void Function() event;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    // final screenHeight = screenSize.height;

    return SizedBox(
      width: screenWidth * 0.6,
      child: MaterialButton(
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: const Color.fromARGB(255, 73, 133, 182),
        onPressed: event,
        child: const Text('SIGN IN', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
