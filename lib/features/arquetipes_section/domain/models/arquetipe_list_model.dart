import 'dart:convert';

//ArquetipeListModel: contains the archetype name
class ArquetipeListModel {
  ArquetipeListModel({
    required this.archetypeName,
  });

  factory ArquetipeListModel.fromMap(Map<String, dynamic> map) {
    return ArquetipeListModel(
      archetypeName: map['archetype_name'] as String,
    );
  }

  factory ArquetipeListModel.fromJson(String source) =>
      ArquetipeListModel.fromMap(json.decode(source) as Map<String, dynamic>);
  final String archetypeName;

  ArquetipeListModel copyWith({
    String? archetypeName,
  }) {
    return ArquetipeListModel(
      archetypeName: archetypeName ?? this.archetypeName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'archetype_name': archetypeName,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'ArquetipeListModel(archetype_name: $archetypeName)';

  @override
  bool operator ==(covariant ArquetipeListModel other) {
    if (identical(this, other)) return true;

    return other.archetypeName == archetypeName;
  }

  @override
  int get hashCode => archetypeName.hashCode;
}
