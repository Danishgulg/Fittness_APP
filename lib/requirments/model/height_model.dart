// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HeightModel {
  int height;
  int heightPointVlue;
  String heightType;
  HeightModel({
    required this.height,
    required this.heightPointVlue,
    required this.heightType,
  });

  HeightModel copyWith({
    int? height,
    int? heightPointVlue,
    String? heightType,
  }) {
    return HeightModel(
      height: height ?? this.height,
      heightPointVlue: heightPointVlue ?? this.heightPointVlue,
      heightType: heightType ?? this.heightType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'height': height,
      'heightPointVlue': heightPointVlue,
      'heightType': heightType,
    };
  }

  factory HeightModel.fromMap(Map<String, dynamic> map) {
    return HeightModel(
      height: map['height'] as int,
      heightPointVlue: map['heightPointVlue'] as int,
      heightType: map['heightType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HeightModel.fromJson(String source) => HeightModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'HeightModel(height: $height, heightPointVlue: $heightPointVlue, heightType: $heightType)';

  @override
  bool operator ==(covariant HeightModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.height == height &&
      other.heightPointVlue == heightPointVlue &&
      other.heightType == heightType;
  }

  @override
  int get hashCode => height.hashCode ^ heightPointVlue.hashCode ^ heightType.hashCode;
}
