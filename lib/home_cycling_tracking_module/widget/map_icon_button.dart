import 'package:flutter/material.dart';

class MapIconButton extends StatelessWidget {
  const MapIconButton({super.key, required this.icon, required this.event});

  final Icon icon;
  final void Function() event;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return MaterialButton(
      elevation: 5,
      shape: const CircleBorder(),
      color: const Color.fromARGB(255, 73, 133, 182),
      onPressed: event,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: icon,
      ),
    );
  }
}
