import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

class StepTrackingPage extends StatefulWidget {
  const StepTrackingPage({super.key});

  @override
  State<StepTrackingPage> createState() => _StepTrackingPageState();
}

class _StepTrackingPageState extends State<StepTrackingPage> {

  String steps = '';

  @override
  void initState() {
    super.initState();
    getStepCount();
  }

  Future<void> getStepCount()async{
    Stream<StepCount> stepCountStream = await Pedometer.stepCountStream;
    stepCountStream.listen((event) {
      steps = 'number of steps : $event';
    });
    if(mounted){
      return ;
    }
  }

  

  @override
  Widget build(BuildContext context) {

     final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;

    return Scaffold(
      backgroundColor:  const Color.fromARGB(255, 4, 30, 60),
      body: Center(
        child: Column(
         children: [
          Text(steps, style: TextStyle(fontSize: screenHeight * 0.1),)
         ],
        ),
      ),
    );
  }
}