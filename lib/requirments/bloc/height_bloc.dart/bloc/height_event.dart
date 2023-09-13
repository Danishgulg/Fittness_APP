part of 'height_bloc.dart';

@immutable
sealed class HeightEvent {
  const HeightEvent();
}


@immutable
class HeightAddEvent extends HeightEvent {
  const HeightAddEvent(this.height);
  final int height;
}

@immutable
class HeightPointValueAddEvent extends HeightEvent{
  const HeightPointValueAddEvent(this.pointValue);
  final int pointValue;
}

@immutable
class HeightTypeAddEvent extends HeightEvent{
  const HeightTypeAddEvent(this.heightType);
  final String heightType;
}

@immutable
class OKHeightEvent extends HeightEvent{}