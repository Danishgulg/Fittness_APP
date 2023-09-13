part of 'height_bloc.dart';

@immutable
sealed class HeightState {
  const HeightState();
}

final class HeightInitial extends HeightState {}


final class HeightValuedState extends HeightState {
  const HeightValuedState(this.heightModel);
  final  HeightModel heightModel;
}
