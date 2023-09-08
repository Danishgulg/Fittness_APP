import 'package:bloc/bloc.dart';
import 'package:fit_now/home_exercise_module/model/exercise_requirment.dart';
import 'package:meta/meta.dart';

part 'home_exercise_event.dart';
part 'home_exercise_state.dart';

class HomeExerciseBloc extends Bloc<HomeExerciseEvent, HomeExerciseState> {
  HomeExerciseBloc() : super(HomeExerciseInitialState()) {
    on<AbsExerciseEvent>((event, emit) async {
     emit(ExerciseLoadingState());
     await Future.delayed(const Duration(seconds: 1));
     emit(ExerciseLoadedState(list: event.exerciseData));
    });
    on<ArmExerciseEvent>((event, emit) async {
      emit(ExerciseLoadingState());
     await Future.delayed(const Duration(seconds: 1));
     emit(ExerciseLoadedState(list: event.exerciseData));     
    });
    on<ChestExerciseEvent>((event, emit) async {
     emit(ExerciseLoadingState());
     await Future.delayed(const Duration(seconds: 1));
     emit(ExerciseLoadedState(list: event.exerciseData));
    });
    on<LegExerciseEvent>((event, emit) async {
     emit(ExerciseLoadingState());
     await Future.delayed(const Duration(seconds: 1));
     emit(ExerciseLoadedState(list: event.exerciseData));
    });
    on<ShoulderExerciseEvent>((event, emit) async {
     emit(ExerciseLoadingState());
     await Future.delayed(const Duration(seconds: 1));
     emit(ExerciseLoadedState(list: event.exerciseData));
    });
  }
}
