import 'package:fit_now/home_running_module/widget/permission_dialog_button.dart';
import 'package:fit_now/requirments/widget/main_title.dart';
import 'package:fit_now/step_tracking_running_module/view/step_tracking_page.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SetTargetButton extends StatelessWidget {
  const SetTargetButton({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final screenArea = (screenHeight + screenWidth) / 2;

    return SizedBox(
      width: screenWidth * 0.5,
      child: MaterialButton(
        onPressed: () async {

           Navigator.of(context).pushNamed(StepTrackingPage.pageName);
          // //check the permission is already allowed or not
          // try {
          //   if (await Permission.activityRecognition.isGranted) {
          //     //nevigate to the StepTrackingPage screen
          //     // ignore: use_build_context_synchronously
          //     Navigator.of(context).pushNamed(StepTrackingPage.pageName,
          //     );
          //   } else if (await Permission.activityRecognition.isDenied) {
          //     // ignore: use_build_context_synchronously
              // showDialog(
              //     barrierDismissible: true,
              //     context: context,
              //     builder: (context) {
              //       return BackdropFilter(
              //         filter: const ColorFilter.linearToSrgbGamma(),
              //         child: Center(
              //           child: Container(
              //             width: screenWidth * 0.9,
              //             height: screenHeight * 0.45,
              //             decoration: BoxDecoration(
              //               color: const Color.fromARGB(255, 4, 35, 61),
              //               borderRadius: BorderRadius.circular(30),
              //             ),
              //             child: Column(
              //               children: [
              //                 SizedBox(
              //                   height: screenHeight * 0.01,
              //                 ),
              //                 const MainTitle(
              //                   text: "Permission",
              //                 ),
              //                 Padding(
              //                     padding: EdgeInsets.only(
              //                         left: screenWidth * 0.05,
              //                         top: screenHeight * 0.05),
              //                     child: Text(
              //                         'ACtivity Recognition permission is required for tracking the stpes, please allow the permission in settings ',
              //                         softWrap: true,
              //                         style: Theme.of(context)
              //                             .textTheme
              //                             .bodyMedium!
              //                             .copyWith(
              //                                 color: Colors.white,
              //                                 fontSize: screenArea * 0.04))),
              //                 Padding(
              //                   padding: EdgeInsets.only(
              //                       top: screenHeight * 0.03,
              //                       right: screenWidth * 0.05),
              //                   child: Align(
              //                       alignment: Alignment.bottomRight,
              //                       child: PermissionDialogButton(
              //                         event: () {
              //                            openAppSettings();
                                       
              //                         },
              //                         text: 'Settings',
              //                       )),
              //                 )
              //               ],
              //             ),
              //           ),
              //         ),
              //       );
              //     });
          //   }
          // } on Exception catch (_) {
          //   // ignore: use_build_context_synchronously
          //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //       content: Text('The Step Counter Sencer is not avaliable')));
          // }
        },
        color: const Color.fromARGB(255, 73, 133, 182),
        elevation: 10,
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Text('Set', style: TextStyle(color: Colors.white, fontSize: screenArea * 0.04),),
      ),
    );
  }
}
