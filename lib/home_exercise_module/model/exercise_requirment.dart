// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ExerciseRequirments {
  String MainTitle;
  String advantage;
  String times;
  ExerciseRequirments({
    required this.MainTitle,
    required this.advantage,
    required this.times,
  });

  ExerciseRequirments copyWith({
    String? MainTitle,
    String? advantage,
    String? times,
  }) {
    return ExerciseRequirments(
      MainTitle: MainTitle ?? this.MainTitle,
      advantage: advantage ?? this.advantage,
      times: times ?? this.times,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'MainTitle': MainTitle,
      'advantage': advantage,
      'times': times,
    };
  }

  factory ExerciseRequirments.fromMap(Map<String, dynamic> map) {
    return ExerciseRequirments(
      MainTitle: map['MainTitle'] as String,
      advantage: map['advantage'] as String,
      times: map['times'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExerciseRequirments.fromJson(String source) => ExerciseRequirments.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ExerciseRequirments(MainTitle: $MainTitle, advantage: $advantage, times: $times)';

  @override
  bool operator ==(covariant ExerciseRequirments other) {
    if (identical(this, other)) return true;
  
    return 
      other.MainTitle == MainTitle &&
      other.advantage == advantage &&
      other.times == times;
  }

  @override
  int get hashCode => MainTitle.hashCode ^ advantage.hashCode ^ times.hashCode;
}
