import 'package:flutter_test/flutter_test.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/card_info/card_set_model.dart';

void main() {
  test('test constructor', () {
    final cardSet = CardSetModel(
      setName: 'setName',
      setCode: 'setCode',
      setRarity: 'setRarity',
      setPrice: 'setPrice',
      setRarityCode: '',
    );
    expect(cardSet.setName, 'setName');
    expect(cardSet.setCode, 'setCode');
    expect(cardSet.setRarity, 'setRarity');
    expect(cardSet.setPrice, 'setPrice');
  });

//test to map
  test('test to map', () {
    final cardSet = CardSetModel(
      setName: 'setName',
      setCode: 'setCode',
      setRarity: 'setRarity',
      setPrice: 'setPrice',
      setRarityCode: '',
    );
    final map = cardSet.toMap();
    expect(map['set_name'], 'setName');
  });

//test from map
  test('test from map', () {
    final map = <String, dynamic>{
      'set_name': 'setName',
      'set_code': 'setCode',
      'set_rarity': 'setRarity',
      'set_price': 'setPrice',
      'set_rarity_code': '',
    };
    final cardSet = CardSetModel.fromMap(map);
    expect(cardSet.setName, 'setName');
  });

//test to string
  test('test to string', () {
    final cardSet = CardSetModel(
      setName: 'setName',
      setCode: 'setCode',
      setRarity: 'setRarity',
      setPrice: 'setPrice',
      setRarityCode: '',
    );
    expect(cardSet.toString(), isA<String>());
  });
}
