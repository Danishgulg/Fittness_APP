import 'package:fit_now/record_item/widget/dialyReportContainer.dart';
import 'package:fit_now/record_item/widget/monthlu_report_Container.dart';
import 'package:fit_now/record_item/widget/weeklyReportContainer.dart';
import 'package:fit_now/requirments/widget/main_title.dart';
import 'package:flutter/material.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 30, 60),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.05),
                child: const Align(
                    alignment: Alignment.topLeft,
                    child: MainTitle(text: 'Dialy Step Report:')),
              ),
              const DialyReportContainer(),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.05),
                child: const Align(
                    alignment: Alignment.topLeft,
                    child: MainTitle(text: 'Weekly Report:')),
              ),
              const WeeklyReportContainer(),
              SizedBox(
                height: screenHeight * 0.05,
              ),
                Padding(
                padding: EdgeInsets.all( screenWidth * 0.05),
                child: const Align(
                    alignment: Alignment.topLeft,
                    child: MainTitle(text: 'Monthly Step Report:')),
              ),
              Padding(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  
                  child: const MonthlyReportContainer())
            ],
          ),
        ),
      ),
    );
  }
}
