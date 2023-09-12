part of 'weight_bloc.dart';

@immutable
sealed class WeightEvent {
  const WeightEvent();
}

@immutable
class WeightAddEvent extends WeightEvent {
  const WeightAddEvent(this.weight);
  final int weight;
}

@immutable
class WeightPointValueAddEvent extends WeightEvent{
  const WeightPointValueAddEvent(this.pointValue);
  final int pointValue;
}

@immutable
class WeightTypeAddEvent extends WeightEvent{
  const WeightTypeAddEvent(this.weightType);
  final String weightType;
}

@immutable
class OkWeightEvent extends WeightEvent{}