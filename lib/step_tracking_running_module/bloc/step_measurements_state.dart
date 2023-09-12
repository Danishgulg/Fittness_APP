part of 'step_measurements_bloc.dart';

@immutable
sealed class StepMeasurementsState {
  const StepMeasurementsState();
}

final class StepMeasurementsInitialState extends StepMeasurementsState {
}

final class StepMeasurementsProceedingState extends StepMeasurementsState {
  const StepMeasurementsProceedingState({required this.otherMesurementsModel, required this.stepMeasuringModel});
  final StepMeasuringModel stepMeasuringModel;
  final OtherMesurementsModel otherMesurementsModel;
}