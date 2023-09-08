// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ExerciseRequirments {
  String titleOfExercise;
  String numberOfTimes;
  String addressOfGif;
  ExerciseRequirments({
    required this.titleOfExercise,
    required this.numberOfTimes,
    required this.addressOfGif,
  });

  ExerciseRequirments copyWith({
    String? titleOfExercise,
    String? numberOfTimes,
    String? addressOfGif,
  }) {
    return ExerciseRequirments(
      titleOfExercise: titleOfExercise ?? this.titleOfExercise,
      numberOfTimes: numberOfTimes ?? this.numberOfTimes,
      addressOfGif: addressOfGif ?? this.addressOfGif,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'titleOfExercise': titleOfExercise,
      'numberOfTimes': numberOfTimes,
      'addressOfGif': addressOfGif,
    };
  }

  factory ExerciseRequirments.fromMap(Map<String, dynamic> map) {
    return ExerciseRequirments(
      titleOfExercise: map['titleOfExercise'] as String,
      numberOfTimes: map['numberOfTimes'] as String,
      addressOfGif: map['addressOfGif'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExerciseRequirments.fromJson(String source) => ExerciseRequirments.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AbsExerciseRequirments(titleOfExercise: $titleOfExercise, numberOfTimes: $numberOfTimes, addressOfGif: $addressOfGif)';

  @override
  bool operator ==(covariant ExerciseRequirments other) {
    if (identical(this, other)) return true;
  
    return 
      other.titleOfExercise == titleOfExercise &&
      other.numberOfTimes == numberOfTimes &&
      other.addressOfGif == addressOfGif;
  }

  @override
  int get hashCode => titleOfExercise.hashCode ^ numberOfTimes.hashCode ^ addressOfGif.hashCode;
}
