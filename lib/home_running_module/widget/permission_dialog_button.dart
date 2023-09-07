import 'package:flutter/material.dart';

class PermissionDialogButton extends StatelessWidget {
  const PermissionDialogButton(
      {super.key, required this.event, required this.text});

  final void Function() event;
  final String text;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final screenArea = (screenHeight + screenWidth) / 2;

    return SizedBox(
        width: screenWidth * 0.3,
        height: screenHeight * 0.07,
        child: MaterialButton(
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
          onPressed: event,
          color: Colors.blue,
          splashColor: Colors.blue.shade900,
          child: Text(
            'Settings',
            style: TextStyle(color: Colors.white, fontSize: screenArea * 0.03),
          ),
        ));
  }
}