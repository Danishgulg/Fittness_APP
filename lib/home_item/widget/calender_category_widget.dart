import 'package:fit_now/home_item/model/calender/model/calender_data.dart';
import 'package:fit_now/home_item/widget/description_text_widget.dart';
import 'package:fit_now/home_item/widget/main_title_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalenderContainerWidget extends StatelessWidget {
  CalenderContainerWidget({super.key});

  final List<CalenderData> dataList = [
    CalenderData(date: 1, dayCode: 'Mo', checkedStatus: true),
    CalenderData(date: 2, dayCode: 'Tu', checkedStatus: true),
    CalenderData(date: 3, dayCode: 'Wed', checkedStatus: true),
    CalenderData(date: 4, dayCode: 'Th', checkedStatus: true),
    CalenderData(date: 5, dayCode: 'Fr', checkedStatus: true),
    CalenderData(date: 6, dayCode: 'St', checkedStatus: true),
    CalenderData(date: 7, dayCode: 'Su', checkedStatus: true),
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.3,
      decoration: BoxDecoration(
        color: Colors.blue.shade900.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.05,
                top: screenHeight * 0.02,
              ),
              child: const MainTitle(
                title: "Calender",
              )),
          Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.05),
              child: const DescriptionText(text: "Check your daily average")),
          Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.05),
              child: MonthSelectingButton()),
          Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.03),
              child: CustomCalenderWidget(dataList: dataList))
        ],
      ),
    );
  }
}

class CustomCalenderWidget extends StatelessWidget {
  const CustomCalenderWidget({super.key, required this.dataList});

  final List<CalenderData> dataList;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return SizedBox(
      height: screenHeight * 0.1, // Set a specific height
      width: screenWidth * 0.9,
      child: ListView.builder(
        itemCount: dataList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: Container(
                height: screenHeight * 0.1,
                width: screenWidth * 0.12, // Adjust width as needed
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Column(
                  children: [
                    Text(
                      '${dataList[index].date}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      dataList[index].dayCode,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                )),
              ),
            ),
            onTap: () {
              // determine what does when we click the calender button
            },
          );
        },
      ),
    );
  }
}

class MonthSelectingButton extends StatelessWidget {
  const MonthSelectingButton({super.key});

  @override
  Widget build(BuildContext context) {
 final screenSize = MediaQuery.of(context).size;
      final screenHeight = screenSize.height;
       final screenWidth = screenSize.width;
     final screenArea = (screenHeight + screenWidth) / 2;

    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.5),
      child: ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.blue)),
        onPressed: () {
          showCupertinoDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) {
              return BackdropFilter(
                filter: const ColorFilter.linearToSrgbGamma(),
                child: Center(
                  child: Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.4,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 4, 35, 61),
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.05),
                            child: const MainTitle(title: "Month"),
                          ),
                          Padding(
                              padding:
                                  EdgeInsets.only(left: screenWidth * 0.05),
                              child: Text('month is required :',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.white, fontSize: screenArea * 0.03))),
                          SizedBox(
                            height: screenHeight * 0.04,
                          ),
                          MonthPicker(
                            selectedWeight: 12,
                            listOfMonth: const [
                              'January',
                              'February',
                              'Marh',
                              'Aprril',
                              'May',
                              'June',
                              'july',
                              'August',
                              'September',
                              'Octuber',
                              'November',
                              'December'
                            ],
                            onWeightChanged: (value) {},
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  child: Text(
                                    'CANCEL',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: Colors.blue,
                                            fontSize: screenArea * 0.04,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                SizedBox(
                                  width: screenWidth * 0.1,
                                ),
                                GestureDetector(
                                  child: Text(
                                    'OK',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            color: Colors.blue,
                                            fontSize: screenArea * 0.04,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {
                                    //here we can add the values of weight to the event stream
                                  },
                                ),
                                SizedBox(
                                  width: screenWidth * 0.05,
                                )
                              ]),
                        ]),
                  ),
                ),
              );
            },
          );
        },
        child: SizedBox(
          width: screenWidth * 0.2,
          child: FittedBox(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.02),
                  child: const Text(
                    'month',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MonthPicker extends StatelessWidget {
  final int selectedWeight;
  final List<String> listOfMonth;
  final ValueChanged<int> onWeightChanged;

  MonthPicker({
    required this.selectedWeight,
    required this.listOfMonth,
    required this.onWeightChanged,
  });
  @override
  Widget build(BuildContext context) {
 final screenSize = MediaQuery.of(context).size;
      final screenHeight = screenSize.height;
       final screenWidth = screenSize.width;
     final screenArea = (screenHeight + screenWidth) / 2;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: screenWidth * 0.33,
          height: screenHeight * 0.2,
          child: CupertinoPicker(
            itemExtent: 40.0,
            diameterRatio: 1,
            selectionOverlay: Container(
              width: screenWidth * 0.1,
              height: screenHeight * 0.06,
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                        color: Colors.white,
                      ),
                      bottom: BorderSide(color: Colors.white))),
            ),
            looping: true,
            scrollController:
                FixedExtentScrollController(initialItem: selectedWeight),
            onSelectedItemChanged: onWeightChanged,
            children: List<Widget>.generate(listOfMonth.length, (index) {
              return Center(
                child: Text(
                  listOfMonth[index],
                  style:  TextStyle(fontSize: screenArea * 0.04, color: Colors.white),
                ),
              );
            }),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}