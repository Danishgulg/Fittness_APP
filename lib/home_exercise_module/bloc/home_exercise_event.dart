part of 'home_exercise_bloc.dart';

@immutable
sealed class HomeExerciseEvent {
  const HomeExerciseEvent();
}

@immutable
class AbsExerciseEvent extends HomeExerciseEvent{
  const AbsExerciseEvent({required this.exerciseData});
  final List<ExerciseRequirments> exerciseData;
}

@immutable
class ArmExerciseEvent extends HomeExerciseEvent{
  const ArmExerciseEvent({required this.exerciseData});
  final List<ExerciseRequirments> exerciseData;
}
@immutable
class LegExerciseEvent extends HomeExerciseEvent{
  const LegExerciseEvent({required this.exerciseData});
  final List<ExerciseRequirments> exerciseData;
}

@immutable
class ChestExerciseEvent extends HomeExerciseEvent{
  const ChestExerciseEvent({required this.exerciseData});
  final List<ExerciseRequirments> exerciseData;
}

@immutable
class ShoulderExerciseEvent extends HomeExerciseEvent{
  const ShoulderExerciseEvent({required this.exerciseData});
  final List<ExerciseRequirments> exerciseData;
}

