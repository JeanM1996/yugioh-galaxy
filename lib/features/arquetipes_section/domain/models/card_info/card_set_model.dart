import 'dart:convert';

//CardSetModel: contains the set of the card
class CardSetModel {
  CardSetModel({
    required this.setName,
    required this.setCode,
    required this.setRarity,
    required this.setRarityCode,
    required this.setPrice,
  });

  factory CardSetModel.fromMap(Map<String, dynamic> map) {
    return CardSetModel(
      setName: map['set_name'] as String,
      setCode: map['set_code'] as String,
      setRarity: map['set_rarity'] as String,
      setRarityCode: map['set_rarity_code'] as String,
      setPrice: map['set_price'] as String,
    );
  }

  factory CardSetModel.fromJson(String source) =>
      CardSetModel.fromMap(json.decode(source) as Map<String, dynamic>);
  final String setName;
  final String setCode;
  final String setRarity;
  final String setRarityCode;
  final String setPrice;

  CardSetModel copyWith({
    String? setName,
    String? setCode,
    String? setRarity,
    String? setRarityCode,
    String? setPrice,
  }) {
    return CardSetModel(
      setName: setName ?? this.setName,
      setCode: setCode ?? this.setCode,
      setRarity: setRarity ?? this.setRarity,
      setRarityCode: setRarityCode ?? this.setRarityCode,
      setPrice: setPrice ?? this.setPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'set_name': setName,
      'set_code': setCode,
      'set_rarity': setRarity,
      'set_rarity_code': setRarityCode,
      'set_price': setPrice,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'CardSetModel(setName: $setName, setCode: $setCode, setRarity: $setRarity, setRarityCode: $setRarityCode, setPrice: $setPrice)';
  }

  @override
  bool operator ==(covariant CardSetModel other) {
    if (identical(this, other)) return true;

    return other.setName == setName &&
        other.setCode == setCode &&
        other.setRarity == setRarity &&
        other.setRarityCode == setRarityCode &&
        other.setPrice == setPrice;
  }

  @override
  int get hashCode {
    return setName.hashCode ^
        setCode.hashCode ^
        setRarity.hashCode ^
        setRarityCode.hashCode ^
        setPrice.hashCode;
  }
}
