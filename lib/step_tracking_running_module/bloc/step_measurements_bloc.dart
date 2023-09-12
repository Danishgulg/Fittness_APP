import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fit_now/step_tracking_running_module/model/other_measurement_model.dart';
import 'package:fit_now/step_tracking_running_module/model/step_measuring_model.dart';
import 'package:meta/meta.dart';
import 'package:pedometer/pedometer.dart';

part 'step_measurements_event.dart';
part 'step_measurements_state.dart';

class StepMeasurementsBloc
    extends Bloc<StepMeasurementsEvent, StepMeasurementsState> {
  int steps = 0;
  int stepTarget;
  int secondsRun = 0;

  StepMeasurementsBloc({required this.stepTarget})
      : super(StepMeasurementsInitialState()) {
    on<StartStepMeasurementsEvent>((event, emit) {
      bool isCounting = event.isCounting;
      if (isClosed) {
        Timer.periodic(const Duration(seconds: 1), (timer) {
          secondsRun = timer.tick;
        });
      }
      getStepCount(isCounting);
      emit(StepMeasurementsProceedingState(
          stepMeasuringModel: StepMeasuringModel(
              isCount: event.isCounting, stepsRun: steps, target: stepTarget),
          otherMesurementsModel: OtherMesurementsModel(
              caloriesBurn: 11,
              time: formatDuration(secondsRun),
              distanceKm: 33)));
    });
  }

  Future<void> getStepCount(bool isCount) async {
    Stream<StepCount> stepCountStream = await Pedometer.stepCountStream;
    stepCountStream.listen((event) {
      if (isCount) {
        steps = event.steps;
      }
    });
  }

  double calculateCaloriesBurned(int steps, double weightInKg, double METVlue) {
    // Define MET value for walking (approximately 3.9 MET for brisk walking)
    double metValue = METVlue;

    // Calculate total energy expenditure (TEE) in calories
    double tee = steps * metValue * weightInKg;

    // Convert TEE to kilocalories (1 calorie = 0.001 kcal)
    double caloriesBurned = tee * 0.001;

    return caloriesBurned;
  }

  String formatDuration(int seconds) {
    int hours = seconds ~/ 3600; // Calculate the number of hours
    int minutes = (seconds % 3600) ~/ 60; // Calculate the number of minutes
    int remainingSeconds = seconds % 60; // Calculate the remaining seconds

    // Format the time as "HH:MM:SS"
    String formattedTime =
        '$hours:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';

    return formattedTime;
  }
}
