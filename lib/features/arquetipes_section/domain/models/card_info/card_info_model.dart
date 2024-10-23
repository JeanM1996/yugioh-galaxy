// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/card_info/card_image_model.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/card_info/card_price_model.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/card_info/card_set_model.dart';

//CardInfoModel: contains the card information
class CardInfoModel {
  final int id;
  final String name;
  final String type;
  final String frameType;
  final String desc;
  final int atk;
  final int def;
  final int level;
  final String race;
  final String attribute;
  final List<CardSetModel> cardSets;
  final List<CardImageModel> cardImages;
  final List<CardPriceModel> cardPrices;
  const CardInfoModel({
    required this.id,
    required this.name,
    required this.type,
    required this.frameType,
    required this.desc,
    required this.atk,
    required this.def,
    required this.level,
    required this.race,
    required this.attribute,
    required this.cardSets,
    required this.cardImages,
    required this.cardPrices,
  });

  CardInfoModel copyWith({
    int? id,
    String? name,
    String? type,
    String? frameType,
    String? desc,
    int? atk,
    int? def,
    int? level,
    String? race,
    String? attribute,
    List<CardSetModel>? cardSets,
    List<CardImageModel>? cardImages,
    List<CardPriceModel>? cardPrices,
  }) {
    return CardInfoModel(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      frameType: frameType ?? this.frameType,
      desc: desc ?? this.desc,
      atk: atk ?? this.atk,
      def: def ?? this.def,
      level: level ?? this.level,
      race: race ?? this.race,
      attribute: attribute ?? this.attribute,
      cardSets: cardSets ?? this.cardSets,
      cardImages: cardImages ?? this.cardImages,
      cardPrices: cardPrices ?? this.cardPrices,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'frameType': frameType,
      'desc': desc,
      'atk': atk,
      'def': def,
      'level': level,
      'race': race,
      'attribute': attribute,
      'card_sets': cardSets.map((x) => x.toMap()).toList(),
      'card_images': cardImages.map((x) => x.toMap()).toList(),
      'card_prices': cardPrices.map((x) => x.toMap()).toList(),
    };
  }

  factory CardInfoModel.fromMap(Map<String, dynamic> map) {
    return CardInfoModel(
      id: map['id'] != null ? map['id'] as int : 0,
      name: map['name'] != null ? map['name'] as String : '',
      type: map['type'] != null ? map['type'] as String : '',
      frameType: map['frameType'] != null ? map['frameType'] as String : '',
      desc: map['desc'] != null ? map['desc'] as String : '',
      atk: map['atk'] != null ? map['atk'] as int : 0,
      def: map['def'] != null ? map['def'] as int : 0,
      level: map['level'] != null ? map['level'] as int : 0,
      race: map['race'] != null ? map['race'] as String : '',
      attribute: map['attribute'] != null ? map['attribute'] as String : '',
      cardSets: map['card_sets'] != null
          ? List<CardSetModel>.from(
              (map['card_sets'] as List<dynamic>).map<CardSetModel>(
                (x) => CardSetModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      cardImages: map['card_images'] != null
          ? List<CardImageModel>.from(
              (map['card_images'] as List<dynamic>).map<CardImageModel>(
                (x) => CardImageModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      cardPrices: map['card_prices'] != null
          ? List<CardPriceModel>.from(
              (map['card_prices'] as List<dynamic>).map<CardPriceModel>(
                (x) => CardPriceModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory CardInfoModel.fromJson(String source) =>
      CardInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CardInfoModel(id: $id, name: $name, type: $type, frameType: $frameType, desc: $desc, atk: $atk, def: $def, level: $level, race: $race, attribute: $attribute, cardSets: $cardSets, cardImages: $cardImages, cardPrices: $cardPrices)';
  }

  @override
  bool operator ==(covariant CardInfoModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.type == type &&
        other.frameType == frameType &&
        other.desc == desc &&
        other.atk == atk &&
        other.def == def &&
        other.level == level &&
        other.race == race &&
        other.attribute == attribute &&
        listEquals(other.cardSets, cardSets) &&
        listEquals(other.cardImages, cardImages) &&
        listEquals(other.cardPrices, cardPrices);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        type.hashCode ^
        frameType.hashCode ^
        desc.hashCode ^
        atk.hashCode ^
        def.hashCode ^
        level.hashCode ^
        race.hashCode ^
        attribute.hashCode ^
        cardSets.hashCode ^
        cardImages.hashCode ^
        cardPrices.hashCode;
  }

  //empty var
  static const empty = CardInfoModel(
    id: 0,
    name: '',
    type: '',
    frameType: '',
    desc: '',
    atk: 0,
    def: 0,
    level: 0,
    race: '',
    attribute: '',
    cardSets: [],
    cardImages: [],
    cardPrices: [],
  );
}
