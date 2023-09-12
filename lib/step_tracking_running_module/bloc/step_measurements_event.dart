part of 'step_measurements_bloc.dart';

@immutable
sealed class StepMeasurementsEvent {
  const StepMeasurementsEvent();
}

@immutable
class StartStepMeasurementsEvent extends StepMeasurementsEvent{
  const StartStepMeasurementsEvent({required this.isCounting});
  final bool isCounting;
}


@immutable
class ResetStepMeasurementsEvent extends StepMeasurementsEvent{
}
