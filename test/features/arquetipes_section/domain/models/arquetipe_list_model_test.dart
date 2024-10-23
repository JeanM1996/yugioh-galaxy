import 'package:flutter_test/flutter_test.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/domain/models/arquetipe_list_model.dart';

void main() {
  test('test constructor', () {
    final basicOption = ArquetipeListModel(archetypeName: 'archetypeName');
    expect(basicOption.archetypeName, 'archetypeName');
  });

//test to map
  test('test to map', () {
    final arquetipeListModel =
        ArquetipeListModel(archetypeName: 'archetypeName');
    final map = arquetipeListModel.toMap();
    expect(map['archetype_name'], 'archetypeName');
  });

//test from map
  test('test from map', () {
    final map = <String, dynamic>{
      'archetype_name': 'archetypeName',
    };
    final arquetipeListModel = ArquetipeListModel.fromMap(map);
    expect(arquetipeListModel.archetypeName, 'archetypeName');
  });

//test to string
  test('test to string', () {
    final archetype = ArquetipeListModel(archetypeName: 'archetypeName');
    expect(archetype.toString(), isA<String>());
  });
}
