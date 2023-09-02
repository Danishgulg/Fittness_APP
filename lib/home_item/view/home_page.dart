import 'package:fit_now/home/home_widget/calender_category_widget.dart';
import 'package:fit_now/home/home_widget/category_widget.dart';
import 'package:fit_now/home/home_widget/description_text_widget.dart';
import 'package:fit_now/home/home_widget/sub_category_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.1),
                Center(child: CalenderContainerWidget()),
                SizedBox(height: screenHeight * 0.05),
                Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.06),
                    child: const DescriptionText(text: 'Exercise Categories :')),
                SizedBox(height: screenHeight * 0.02),
                const Center(
                    child: CategoryContainerWidget(
                  image: AssetImage('assets/images/running.jpg'),
                  description:
                      'This will measure your step count along with caliries',
                  mainText: "Running",
                )),
                const Center(
                    child: CategoryContainerWidget(
                  image: AssetImage('assets/images/cycling.jpg'),
                  description: 'you can select the rute by using map',
                  mainText: "Cycling",
                )),
                Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.06),
                    child: const DescriptionText(
                        text: 'Home exercise categories :')),
                const Center(child: SubCategoryListWidget()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
