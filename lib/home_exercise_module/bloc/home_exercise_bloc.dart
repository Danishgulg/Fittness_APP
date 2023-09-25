import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fit_now/home_exercise_module/model/exercise_requirment.dart';
import 'package:fit_now/utils/firebase/database/database_operations.dart';
import 'package:fit_now/utils/firebase/storage/storage_opreations.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_exercise_event.dart';
part 'home_exercise_state.dart';

class HomeExerciseBloc extends Bloc<HomeExerciseEvent, HomeExerciseState> {
  FirebaseOperations firebaseOperations = FirebaseOperations();
  StorageOperations storageOperations = StorageOperations();

  static const String mainCollection = 'HomeExercise';
  static const String absDoc = 'AbsExercise';
  static const String level = 'beginner';

  HomeExerciseBloc() : super(HomeExerciseInitialState()) {
    on<AbsExerciseEvent>((event, emit) async {
      emit(ExerciseLoadingState());

      // get the snapshot of all doc in exercise query
      QuerySnapshot? querySnapshot =
          await firebaseOperations.getDocumentInCollection(
              collection: mainCollection,
              doc: event.exerciseTypeName,
              collection2: event.levelOfexercise);
      
      // get the list of string address of gifs on the fire storage

      List<String> gifList = await storageOperations.getDataInUrl(bucketRef: event.gifBucketRef);
 
      List<ExerciseRequirments> listRequirment = [];

      //traverse all doc in query

      if (querySnapshot != null) {
        for (DocumentSnapshot docSnapShot in querySnapshot.docs) {
          ExerciseRequirments exerciseRequirments = ExerciseRequirments.fromMap(
              docSnapShot.data() as Map<String, dynamic>);
          listRequirment.add(exerciseRequirments);
        }
      
      // emit the data which is required for the exercise module
        emit(ExerciseLoadedState(list: listRequirment, gifList: gifList));
      }
    });
  }
}
