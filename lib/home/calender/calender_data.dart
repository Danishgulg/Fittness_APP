// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CalenderData {
  int date;
  String dayCode;
  bool checkedStatus;
  CalenderData({
    required this.date,
    required this.dayCode,
    required this.checkedStatus,
  });

  CalenderData copyWith({
    int? date,
    String? dayCode,
    bool? checkedStatus,
  }) {
    return CalenderData(
      date: date ?? this.date,
      dayCode: dayCode ?? this.dayCode,
      checkedStatus: checkedStatus ?? this.checkedStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'dayCode': dayCode,
      'checkedStatus': checkedStatus,
    };
  }

  factory CalenderData.fromMap(Map<String, dynamic> map) {
    return CalenderData(
      date: map['date'] as int,
      dayCode: map['dayCode'] as String,
      checkedStatus: map['checkedStatus'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory CalenderData.fromJson(String source) => CalenderData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CalenderData(date: $date, dayCode: $dayCode, checkedStatus: $checkedStatus)';

  @override
  bool operator ==(covariant CalenderData other) {
    if (identical(this, other)) return true;
  
    return 
      other.date == date &&
      other.dayCode == dayCode &&
      other.checkedStatus == checkedStatus;
  }

  @override
  int get hashCode => date.hashCode ^ dayCode.hashCode ^ checkedStatus.hashCode;
}
