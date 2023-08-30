import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        color: const Color.fromARGB(255, 4, 30, 60),
        child: SingleChildScrollView(
          child: Column(children: []),
        ),
      )),
    );
  }
}
