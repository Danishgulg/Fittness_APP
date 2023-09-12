// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WeightModel {
  int weight;
  String typeOfWeight;
  int weightPointValue;
  WeightModel({
    required this.weight,
    required this.typeOfWeight,
    required this.weightPointValue,
  });

  WeightModel copyWith({
    int? weight,
    String? typeOfWeight,
    int? weightPointValue,
  }) {
    return WeightModel(
      weight: weight ?? this.weight,
      typeOfWeight: typeOfWeight ?? this.typeOfWeight,
      weightPointValue: weightPointValue ?? this.weightPointValue,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'weight': weight,
      'typeOfWeight': typeOfWeight,
      'weightPointValue': weightPointValue,
    };
  }

  factory WeightModel.fromMap(Map<String, dynamic> map) {
    return WeightModel(
      weight: map['weight'] as int,
      typeOfWeight: map['typeOfWeight'] as String,
      weightPointValue: map['weightPointValue'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeightModel.fromJson(String source) => WeightModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'WeightModel(weight: $weight, typeOfWeight: $typeOfWeight, weightPointValue: $weightPointValue)';

  @override
  bool operator ==(covariant WeightModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.weight == weight &&
      other.typeOfWeight == typeOfWeight &&
      other.weightPointValue == weightPointValue;
  }

  @override
  int get hashCode => weight.hashCode ^ typeOfWeight.hashCode ^ weightPointValue.hashCode;
}
