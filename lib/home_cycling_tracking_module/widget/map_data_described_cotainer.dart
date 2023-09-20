import 'package:fit_now/home_item/widget/description_text_widget.dart';
import 'package:flutter/material.dart';

class ProgressMaterialButton extends StatelessWidget {
  const ProgressMaterialButton(
      {super.key, required this.text, required this.event});

  final Widget text;
  final void Function() event;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return SizedBox(
      width: screenWidth * 0.3,
      height: screenHeight * 0.07,
      child: MaterialButton(
        color: const Color.fromARGB(255, 73, 133, 182),
        elevation: 10,
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: text,
        onPressed: event,
      ),
    );
  }
}

class MapDataDescribeContainer extends StatelessWidget {
  const MapDataDescribeContainer(
      {super.key, required this.time, required this.unit, required this.type});

  final String time;
  final String unit;
  final String type;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Container(
      width: screenWidth * 0.4,
      height: screenHeight * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 4, 35, 61),
      ),
      child: FittedBox(
        child: Row(
          children: [
            SizedBox(
              width: screenWidth * 0.01,
            ),
            Text(
              '$type :   ',
              softWrap: true,
              style:
                  TextStyle(color: Colors.white, fontSize: screenWidth * 0.03),
            ),
            Column(children: [
              DescriptionText(
                text: time,
              ),
              Text(
                unit,
                softWrap: true,
                style: TextStyle(
                    color: Colors.white, fontSize: screenWidth * 0.03),
              )
            ]),
          ],
        ),
      ),
    );
  }
}

