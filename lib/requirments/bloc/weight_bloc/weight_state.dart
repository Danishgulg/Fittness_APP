part of 'weight_bloc.dart';

@immutable
sealed class WeightState {
  const WeightState();
}

final class WeightInitialState extends WeightState {}

final class WeightValuedState extends WeightState {
  const WeightValuedState(this.weightModel);
  final  WeightModel weightModel;
}
