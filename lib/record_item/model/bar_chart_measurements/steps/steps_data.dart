// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fit_now/record_item/model/individual_bar.dart';

class WeeklyStepData {
  final double SunStep;
  final double MonStep;
  final double TueStep;
  final double WedStep;
  final double ThuStep;
  final double FriStep;
  final double SatStep;
  WeeklyStepData({
    required this.SunStep,
    required this.MonStep,
    required this.TueStep,
    required this.WedStep,
    required this.ThuStep,
    required this.FriStep,
    required this.SatStep,
  });

  //initilize dummy data for individual bar to create a list
  List<IndividualBar> individualBarList = [];
  void getBarListData(){
    individualBarList = [
      IndividualBar(x: 0, y: 10),
      IndividualBar(x: 1, y: 20),
      IndividualBar(x: 2, y: 40.0),
      IndividualBar(x: 3, y: 15),
      IndividualBar(x: 4, y: 12),
      IndividualBar(x: 5, y: 50),
      IndividualBar(x: 6, y: 30),
    ];
  }


  WeeklyStepData copyWith({
    double? SunStep,
    double? MonStep,
    double? TueStep,
    double? WedStep,
    double? ThuStep,
    double? FriStep,
    double? SatStep,
  }) {
    return WeeklyStepData(
      SunStep: SunStep ?? this.SunStep,
      MonStep: MonStep ?? this.MonStep,
      TueStep: TueStep ?? this.TueStep,
      WedStep: WedStep ?? this.WedStep,
      ThuStep: ThuStep ?? this.ThuStep,
      FriStep: FriStep ?? this.FriStep,
      SatStep: SatStep ?? this.SatStep,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'SunStep': SunStep,
      'MonStep': MonStep,
      'TueStep': TueStep,
      'WedStep': WedStep,
      'ThuStep': ThuStep,
      'FriStep': FriStep,
      'SatStep': SatStep,
    };
  }

  factory WeeklyStepData.fromMap(Map<String, dynamic> map) {
    return WeeklyStepData(
      SunStep: map['SunStep'] as double,
      MonStep: map['MonStep'] as double,
      TueStep: map['TueStep'] as double,
      WedStep: map['WedStep'] as double,
      ThuStep: map['ThuStep'] as double,
      FriStep: map['FriStep'] as double,
      SatStep: map['SatStep'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeeklyStepData.fromJson(String source) => WeeklyStepData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeeklyStepData(SunStep: $SunStep, MonStep: $MonStep, TueStep: $TueStep, WedStep: $WedStep, ThuStep: $ThuStep, FriStep: $FriStep, SatStep: $SatStep)';
  }

  @override
  bool operator ==(covariant WeeklyStepData other) {
    if (identical(this, other)) return true;
  
    return 
      other.SunStep == SunStep &&
      other.MonStep == MonStep &&
      other.TueStep == TueStep &&
      other.WedStep == WedStep &&
      other.ThuStep == ThuStep &&
      other.FriStep == FriStep &&
      other.SatStep == SatStep;
  }

  @override
  int get hashCode {
    return SunStep.hashCode ^
      MonStep.hashCode ^
      TueStep.hashCode ^
      WedStep.hashCode ^
      ThuStep.hashCode ^
      FriStep.hashCode ^
      SatStep.hashCode;
  }
}




