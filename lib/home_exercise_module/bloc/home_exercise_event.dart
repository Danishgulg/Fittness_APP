part of 'home_exercise_bloc.dart';

@immutable
sealed class HomeExerciseEvent {
  const HomeExerciseEvent();
}

@immutable
class AbsExerciseEvent extends HomeExerciseEvent{
  const AbsExerciseEvent({required this.exerciseTypeName, required this.levelOfexercise, required this.gifBucketRef});
  final String exerciseTypeName;
  final String levelOfexercise;
  final String gifBucketRef;
}



