part of 'home_exercise_bloc.dart';

@immutable
sealed class HomeExerciseState {
  const HomeExerciseState();
}

final class HomeExerciseInitialState extends HomeExerciseState {}

final class ExerciseLoadingState extends HomeExerciseState {}

final class ExerciseLoadedState extends HomeExerciseState {
  const ExerciseLoadedState({required this.list, required this.gifList});
  final List<ExerciseRequirments> list;
  final List<String> gifList;
}
