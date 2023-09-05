import 'package:fit_now/home_item/widget/description_text_widget.dart';
import 'package:fit_now/record_item/widget/bar_chart_widget.dart';
import 'package:flutter/material.dart';

class ReportButton extends StatelessWidget {
  const ReportButton(
      {super.key,
      required this.text,
      required this.ontab,
      required this.selectedColor});

  final Color selectedColor;
  final void Function() ontab;
  final String text;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;

    return MaterialButton(
        height: screenHeight * 0.05,
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          //emit the weekly graph state with distance event
        },
        //check the color by using block if it is selected then change the color to selected

        color: selectedColor,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ));
  }
}

class MonthlyReportContainer extends StatelessWidget {
  const MonthlyReportContainer({super.key});

  //dummy data for graph
  final List<double> monthlyReportList = const [
    23.4,
    54.32,
    14.32,
    51.32,
    23.32,
    64.32,
    99.32,
      23.4,
    54.32,
    14.32,
    51.32,
    23.32,
    64.32,
    99.32,
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
          height: screenHeight * 0.5,
         width: screenWidth * 1.2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white30),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              height: screenHeight * 0.35,
              width: screenWidth * 1.2,
              child: MonthlyBarChartWidget(
                monthlyReportList: monthlyReportList,
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.04),
                    child: const DescriptionText(text: 'select the type :'))),
            SizedBox(
              height: screenHeight * 0.05,
              child: Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.04),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ReportButton(
                      text: 'steps',
                      ontab: () {
                        //emit the weekly graph state with steps event
                      },
                      selectedColor: Colors.grey,
                    ),
                    SizedBox(
                      width: screenWidth * 0.04,
                    ),
                    ReportButton(
                      text: 'calories',
                      ontab: () {
                        //emit the weekly graph state with steps event
                      },
                      selectedColor: Colors.grey,
                    ),
                    SizedBox(
                      width: screenWidth * 0.04,
                    ),
                    ReportButton(
                        text: 'time',
                        ontab: () {
                          //emit the weekly graph state with steps event
                        },
                        selectedColor: Colors.blue),
                    SizedBox(
                      width: screenWidth * 0.04,
                    ),
                    ReportButton(
                      text: 'distance',
                      ontab: () {
                        //emit the weekly graph state with steps event
                      },
                      selectedColor: Colors.grey,
                    ),
                    SizedBox(
                      width: screenWidth * 0.04,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.04,
            )
          ])),
    );
  }
}
