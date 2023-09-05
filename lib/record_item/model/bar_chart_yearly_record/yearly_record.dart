// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fit_now/record_item/model/individual_bar.dart';

class YearlyRecord {
  double january;
  double february;
  double march;
  double april;
  double may;
  double june;
  double july;
  double august;
  double septumber;
  double october;
  double november;
  double december;
  YearlyRecord({
    required this.january,
    required this.february,
    required this.march,
    required this.april,
    required this.may,
    required this.june,
    required this.july,
    required this.august,
    required this.septumber,
    required this.october,
    required this.november,
    required this.december,
  });

  YearlyRecord copyWith({
    double? january,
    double? february,
    double? march,
    double? april,
    double? may,
    double? june,
    double? july,
    double? august,
    double? septumber,
    double? october,
    double? november,
    double? december,
  }) {
    return YearlyRecord(
      january: january ?? this.january,
      february: february ?? this.february,
      march: march ?? this.march,
      april: april ?? this.april,
      may: may ?? this.may,
      june: june ?? this.june,
      july: july ?? this.july,
      august: august ?? this.august,
      septumber: septumber ?? this.septumber,
      october: october ?? this.october,
      november: november ?? this.november,
      december: december ?? this.december,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'january': january,
      'february': february,
      'march': march,
      'april': april,
      'may': may,
      'june': june,
      'july': july,
      'august': august,
      'septumber': septumber,
      'october': october,
      'november': november,
      'december': december,
    };
  }

  factory YearlyRecord.fromMap(Map<String, dynamic> map) {
    return YearlyRecord(
      january: map['january'] as double,
      february: map['february'] as double,
      march: map['march'] as double,
      april: map['april'] as double,
      may: map['may'] as double,
      june: map['june'] as double,
      july: map['july'] as double,
      august: map['august'] as double,
      septumber: map['septumber'] as double,
      october: map['october'] as double,
      november: map['november'] as double,
      december: map['december'] as double,
    );
  }

  List<IndividualBar> individualBarList = [];
  void getBarListData() {
    individualBarList = [
      IndividualBar(x: 0, y: 10),
      IndividualBar(x: 1, y: 20),
      IndividualBar(x: 2, y: 40.0),
      IndividualBar(x: 3, y: 15),
      IndividualBar(x: 4, y: 12),
      IndividualBar(x: 5, y: 50),
      IndividualBar(x: 6, y: 30),
       IndividualBar(x: 0, y: 10),
      IndividualBar(x: 1, y: 20),
      IndividualBar(x: 2, y: 40.0),
      IndividualBar(x: 3, y: 15),
      IndividualBar(x: 4, y: 12),
      IndividualBar(x: 5, y: 50),
      IndividualBar(x: 6, y: 30),
    ];
  }

  String toJson() => json.encode(toMap());

  factory YearlyRecord.fromJson(String source) =>
      YearlyRecord.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'YearlyReport(january: $january, february: $february, march: $march, april: $april, may: $may, june: $june, july: $july, august: $august, septumber: $septumber, october: $october, november: $november, december: $december)';
  }

  @override
  bool operator ==(covariant YearlyRecord other) {
    if (identical(this, other)) return true;

    return other.january == january &&
        other.february == february &&
        other.march == march &&
        other.april == april &&
        other.may == may &&
        other.june == june &&
        other.july == july &&
        other.august == august &&
        other.septumber == septumber &&
        other.october == october &&
        other.november == november &&
        other.december == december;
  }

  @override
  int get hashCode {
    return january.hashCode ^
        february.hashCode ^
        march.hashCode ^
        april.hashCode ^
        may.hashCode ^
        june.hashCode ^
        july.hashCode ^
        august.hashCode ^
        septumber.hashCode ^
        october.hashCode ^
        november.hashCode ^
        december.hashCode;
  }
}
