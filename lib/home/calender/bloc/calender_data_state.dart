part of 'calender_data_bloc.dart';

@immutable
sealed class CalenderDataState {}

final class CalenderDataInitialState extends CalenderDataState {
  // final List<CalenderData> initalCalenderList;
  // CalenderDataInitialState(this.initalCalenderList);
}

final class CalenderDataselectedState extends CalenderDataState {
  final List<CalenderData> initalCalenderList;
  final String selectedMonth;
  CalenderDataselectedState({required this.initalCalenderList, required this.selectedMonth});
}