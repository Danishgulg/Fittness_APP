// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StepMeasuringModel {

  int stepsRun;
  int target;
  bool isCount;
  StepMeasuringModel({
    required this.stepsRun,
    required this.target,
    required this.isCount,
  });

  StepMeasuringModel copyWith({
    int? stepsRun,
    int? target,
    bool? isCount,
  }) {
    return StepMeasuringModel(
      stepsRun: stepsRun ?? this.stepsRun,
      target: target ?? this.target,
      isCount: isCount ?? this.isCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stepsRun': stepsRun,
      'target': target,
      'isCount': isCount,
    };
  }

  factory StepMeasuringModel.fromMap(Map<String, dynamic> map) {
    return StepMeasuringModel(
      stepsRun: map['stepsRun'] as int,
      target: map['target'] as int,
      isCount: map['isCount'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory StepMeasuringModel.fromJson(String source) => StepMeasuringModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StepMeasuringModel(stepsRun: $stepsRun, target: $target, isCount: $isCount)';

  @override
  bool operator ==(covariant StepMeasuringModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.stepsRun == stepsRun &&
      other.target == target &&
      other.isCount == isCount;
  }

  @override
  int get hashCode => stepsRun.hashCode ^ target.hashCode ^ isCount.hashCode;
}
