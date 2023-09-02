part of 'calender_data_bloc.dart';

@immutable
sealed class CalenderDataEvent {
  const CalenderDataEvent();
}

@immutable
final class CalenderDataInitialEvent extends CalenderDataEvent{}

@immutable
final class CalenderDataSelectedEvent extends CalenderDataEvent{} 
