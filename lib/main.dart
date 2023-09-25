import 'package:firebase_core/firebase_core.dart';
import 'package:fit_now/Access/View/access_view.dart';
import 'package:fit_now/firebase_options.dart';
import 'package:fit_now/home_exercise_module/bloc/home_exercise_bloc.dart';
import 'package:fit_now/home_exercise_module/exercises/abs/view/abs_choose_level_page.dart';
import 'package:fit_now/home_exercise_module/exercises/abs/view/abs_exercise_page.dart';
import 'package:fit_now/home_exercise_module/exercises/arm/view/arm_choose_level_page.dart';
import 'package:fit_now/home_exercise_module/exercises/chest/view/chest_choose_level_page.dart';
import 'package:fit_now/home_exercise_module/exercises/leg/view/leg_choose_level_page.dart';
import 'package:fit_now/home_exercise_module/exercises/shoulder_back/view/shoulder_choose_level_page.dart';
import 'package:fit_now/home_item/view/home_page.dart';
import 'package:fit_now/home_running_module/view/running_page_widget.dart';
import 'package:fit_now/main_screen/main_screen_page.dart';
import 'package:fit_now/requirments/bloc/height_bloc.dart/bloc/height_bloc.dart';
import 'package:fit_now/requirments/bloc/weight_bloc/weight_bloc.dart';
import 'package:fit_now/requirments/view/requirment_gathring_page.dart';
import 'package:fit_now/sign_in/view/sign_in_page.dart';
import 'package:fit_now/sign_up/bloc/PasswordField/password_field_bloc.dart';
import 'package:fit_now/sign_up/bloc/check_password/check_password_field_bloc.dart';
import 'package:fit_now/sign_up/view/sign_up_page.dart';
import 'package:fit_now/step_tracking_running_module/view/step_tracking_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // home exercise module bloc

        BlocProvider(
          create: (context) => HomeExerciseBloc(),
        ),

        //requirment bloc
        BlocProvider(
          create: (context) => WeightBloc(),
        ),
        //requirment bloc
        BlocProvider(
          create: (context) => HeightBloc(),
        ),
        //signUp bloc
        BlocProvider(
          create: (context) => PasswordFieldBloc(),
        ),
        BlocProvider(
          create: (context) => CheckPasswordFieldBloc(),
        ),
        
       
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: AccessPage.pageName,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}

Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AccessPage.pageName:
      return CupertinoPageRoute(
        builder: (context) => const AccessPage(),
      );
    case RequirmentGathringPage.pageName:
      return CupertinoPageRoute(
        builder: (context) => const RequirmentGathringPage(),
      );
    case MainScreenPage.pageName:
      return CupertinoPageRoute(
        builder: (context) => const MainScreenPage(),
      );
    case HomePage.pageName:
      return CupertinoPageRoute(
        builder: (context) => const HomePage(),
      );
    case StepTrackingPage.pageName:
      return CupertinoPageRoute(
        builder: (context) => const StepTrackingPage(),
      );
    case RunningPage.pageName:
      return CupertinoPageRoute(
        builder: (context) => const RunningPage(),
      );
    case AbsExercisePage.pageName:
      return CupertinoPageRoute(
        builder: (context) => const AbsExercisePage(),
      );
    case AbsChooseLevelPage.pageName:
      return CupertinoPageRoute(
        builder: (context) => const AbsChooseLevelPage(),
      );
    case ChestChooseLevelPage.pageName:
      return CupertinoPageRoute(
        builder: (context) => const ChestChooseLevelPage(),
      );
    case LegChooseLevelPage.pageName:
      return CupertinoPageRoute(
        builder: (context) => const LegChooseLevelPage(),
      );
    case ArmChooseLevelPage.pageName:
      return CupertinoPageRoute(
        builder: (context) => const ArmChooseLevelPage(),
      );
    case ShoulderChooseLevelPage.pageName:
      return CupertinoPageRoute(
        builder: (context) => const ShoulderChooseLevelPage(),
      );
    case Signup.pageName:
      return CupertinoPageRoute(
        builder: (context) => const Signup(),
      );
    case SignInPage.pageName:
      return CupertinoPageRoute(
        builder: (context) => const SignInPage(),
      );
    default:
      return null;
  }
}
