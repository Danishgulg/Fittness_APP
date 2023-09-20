import 'package:fit_now/home_cycling_tracking_module/view/cycling_tracking_page.dart';
import 'package:fit_now/home_item/widget/calender_category_widget.dart';
import 'package:fit_now/home_item/widget/category_widget.dart';
import 'package:fit_now/home_item/widget/description_text_widget.dart';
import 'package:fit_now/home_item/widget/sub_category_widget.dart';
import 'package:fit_now/home_running_module/view/running_page_widget.dart';
import 'package:fit_now/home_running_module/widget/permission_dialog_button.dart';
import 'package:fit_now/requirments/widget/main_title.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  static const String pageName = 'HomePage';

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
                SizedBox(height: screenHeight * 0.1),
                Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.06),
                    child:
                        const DescriptionText(text: 'Exercise Categories :')),
                SizedBox(height: screenHeight * 0.02),

                //running container

                Center(
                    child: CategoryContainerWidget(
                  image: const AssetImage('assets/images/running.jpg'),
                  onTapEvent: () {
                    Navigator.of(context).pushNamed(
                      RunningPage.pageName,
                    );
                  },
                  description:
                      'This will measure your step count along with caliries',
                  mainText: "Running",
                )),

                //cycling Container

                Center(
                    child: CategoryContainerWidget(
                        image: const AssetImage('assets/images/cycling.jpg'),
                        description: 'you can select the rute by using map',
                        mainText: "Cycling",
                        onTapEvent: () async {
                      
                            // ignore: use_build_context_synchronously
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return CyclingTrackingPage();
                              },
                            ));
                          
                        })),

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
