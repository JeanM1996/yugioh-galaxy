import 'package:flutter_test/flutter_test.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/card_info/card_image_model.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/card_info/card_info_model.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/card_info/card_price_model.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/card_info/card_set_model.dart';

void main() {
  test('test constructor', () {
    const card = CardInfoModel(
      id: 1,
      name: 'name',
      type: 'type',
      desc: 'desc',
      atk: 1,
      def: 1,
      level: 1,
      race: '',
      attribute: '',
      cardSets: [],
      cardImages: [],
      cardPrices: [],
      frameType: '',
    );
    expect(card.id, 1);
    expect(card.name, 'name');
    expect(card.type, 'type');
    expect(card.desc, 'desc');
    expect(card.atk, 1);
    expect(card.def, 1);
    expect(card.level, 1);
    expect(card.race, '');
    expect(card.attribute, '');
    expect(card.cardSets, <CardSetModel>[]);
    expect(card.cardImages, <CardImageModel>[]);
    expect(card.cardPrices, <CardPriceModel>[]);
  });

//test to map
  test('test to map', () {
    const card = CardInfoModel(
      id: 1,
      name: 'name',
      type: 'type',
      desc: 'desc',
      atk: 1,
      def: 1,
      level: 1,
      race: '',
      attribute: '',
      cardSets: [],
      cardImages: [],
      cardPrices: [],
      frameType: '',
    );
    final map = card.toMap();
    expect(map['id'], 1);
  });

//test from map
  test('test from map', () {
    final map = <String, dynamic>{
      'id': 1,
      'name': 'name',
      'type': 'type',
      'desc': 'desc',
      'atk': 1,
      'def': 1,
    };
    final card = CardInfoModel.fromMap(map);
    expect(card.id, 1);
  });

//test to string
  test('test to string', () {
    const card = CardInfoModel(
      id: 1,
      name: 'name',
      type: 'type',
      desc: 'desc',
      atk: 1,
      def: 1,
      level: 1,
      race: '',
      attribute: '',
      cardSets: [],
      cardImages: [],
      cardPrices: [],
      frameType: '',
    );
    expect(card.toString(), isA<String>());
  });
}
