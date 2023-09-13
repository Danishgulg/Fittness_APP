// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OtherMesurementsModel {
  int caloriesBurn;
  String time;
  double distanceKm;
  OtherMesurementsModel({
    required this.caloriesBurn,
    required this.time,
    required this.distanceKm,
  });

  OtherMesurementsModel copyWith({
    int? caloriesBurn,
    String? time,
    double? distanceKm,
  }) {
    return OtherMesurementsModel(
      caloriesBurn: caloriesBurn ?? this.caloriesBurn,
      time: time ?? this.time,
      distanceKm: distanceKm ?? this.distanceKm,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'caloriesBurn': caloriesBurn,
      'time': time,
      'distanceKm': distanceKm,
    };
  }

  factory OtherMesurementsModel.fromMap(Map<String, dynamic> map) {
    return OtherMesurementsModel(
      caloriesBurn: map['caloriesBurn'] as int,
      time: map['time'] as String,
      distanceKm: map['distanceKm'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory OtherMesurementsModel.fromJson(String source) => OtherMesurementsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'OtherMesurementsModel(caloriesBurn: $caloriesBurn, time: $time, distanceKm: $distanceKm)';

  @override
  bool operator ==(covariant OtherMesurementsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.caloriesBurn == caloriesBurn &&
      other.time == time &&
      other.distanceKm == distanceKm;
  }

  @override
  int get hashCode => caloriesBurn.hashCode ^ time.hashCode ^ distanceKm.hashCode;
}
